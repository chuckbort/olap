import io
import mysql.connector
from flask import Flask, render_template, request, redirect, url_for, abort, send_file
import matplotlib
from matplotlib import pyplot as plt

matplotlib.use('Agg')  # для генерування діаграм без вікна

# Імпортуємо модулі для ETL та діаграм
from etl import extract_oltp_data, transform_data, load_to_dw
import charts

app = Flask(__name__)

# -------------------------
# 1) НАЛАШТУВАННЯ
# -------------------------
OLTP_DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': 'MyPass123',
    'database': 'oltp_db'
}

DW_DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': 'MyPass123',
    'database': 'bi_dw_db'
}

TABLES_CONFIG = {
    "sales": {
        "columns": ["sale_id","sale_date","product_id","manager_id","region","quantity"],
        "pk": "sale_id"
    },
    "products": {
        "columns": ["product_id","product_name","category","supplier_id","price"],
        "pk": "product_id"
    },
    "managers": {
        "columns": ["manager_id","manager_name","position","hire_date"],
        "pk": "manager_id"
    },
    "suppliers": {
        "columns": ["supplier_id","supplier_name","contact_info"],
        "pk": "supplier_id"
    }
}

# -------------------------
# 2) ГОЛОВНА СТОРІНКА
# -------------------------
@app.route('/')
def index():

    return render_template('index.html')


# -------------------------
# 3) УНІВЕРСАЛЬНІ МАРШРУТИ ДЛЯ ОЛТП
# -------------------------
def get_table_data(table_name):

    if table_name not in TABLES_CONFIG:
        abort(404, f"Unknown table {table_name}")

    columns_allowed = TABLES_CONFIG[table_name]["columns"]
    sort_col = request.args.get('sort')
    sort_order = request.args.get('order','asc')

    if sort_col not in columns_allowed:
        sort_col = None
    if sort_order not in ['asc','desc']:
        sort_order = 'asc'

    base_query = f"SELECT * FROM {table_name}"
    if sort_col:
        query = f"{base_query} ORDER BY {sort_col} {sort_order}"
    else:
        query = base_query

    conn = mysql.connector.connect(**OLTP_DB_CONFIG)
    cursor = conn.cursor(dictionary=True)
    cursor.execute(query)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    return rows, columns_allowed, sort_col, sort_order


@app.route('/oltp/<table_name>')
def show_table(table_name):
    if table_name not in TABLES_CONFIG:
        abort(404, f"Unknown table {table_name}")

    rows, columns, sort_col, sort_order = get_table_data(table_name)
    pk = TABLES_CONFIG[table_name]["pk"]

    return render_template('oltp_list.html',
                           table_name=table_name,
                           rows=rows,
                           columns=columns,
                           pk=pk,
                           sort_col=sort_col,
                           sort_order=sort_order)


@app.route('/oltp/<table_name>/new', methods=['GET','POST'])
def create_record(table_name):
    if table_name not in TABLES_CONFIG:
        abort(404, f"Unknown table {table_name}")

    columns = TABLES_CONFIG[table_name]["columns"]
    pk = TABLES_CONFIG[table_name]["pk"]
    editable_cols = [c for c in columns if c != pk]

    if request.method == 'POST':
        vals = []
        placeholders = []
        for col in editable_cols:
            val = request.form.get(col)
            vals.append(val)
            placeholders.append("%s")

        col_str = ", ".join(editable_cols)
        ph_str = ", ".join(placeholders)
        query = f"INSERT INTO {table_name} ({col_str}) VALUES ({ph_str})"

        conn = mysql.connector.connect(**OLTP_DB_CONFIG)
        cursor = conn.cursor()
        cursor.execute(query, tuple(vals))
        conn.commit()
        cursor.close()
        conn.close()

        return redirect(url_for('show_table', table_name=table_name))
    else:
        return render_template('oltp_form.html',
                               mode='new',
                               table_name=table_name,
                               columns=editable_cols,
                               record=None)


@app.route('/oltp/<table_name>/edit/<int:record_id>', methods=['GET','POST'])
def edit_record(table_name, record_id):
    if table_name not in TABLES_CONFIG:
        abort(404, f"Unknown table {table_name}")

    columns = TABLES_CONFIG[table_name]["columns"]
    pk = TABLES_CONFIG[table_name]["pk"]
    editable_cols = [c for c in columns if c != pk]

    if request.method == 'POST':
        # Зберегти зміни
        vals = []
        set_parts = []
        for col in editable_cols:
            val = request.form.get(col)
            vals.append(val)
            set_parts.append(f"{col}=%s")

        set_clause = ", ".join(set_parts)
        query = f"UPDATE {table_name} SET {set_clause} WHERE {pk}=%s"
        vals.append(record_id)

        conn = mysql.connector.connect(**OLTP_DB_CONFIG)
        cursor = conn.cursor()
        cursor.execute(query, tuple(vals))
        conn.commit()
        cursor.close()
        conn.close()

        return redirect(url_for('show_table', table_name=table_name))
    else:
        # GET -> показати форму з поточними значеннями
        query = f"SELECT * FROM {table_name} WHERE {pk}=%s"
        conn = mysql.connector.connect(**OLTP_DB_CONFIG)
        cursor = conn.cursor(dictionary=True)
        cursor.execute(query, (record_id,))
        row = cursor.fetchone()
        cursor.close()
        conn.close()
        if not row:
            abort(404, f"No record with {pk}={record_id} in {table_name}")

        return render_template('oltp_form.html',
                               mode='edit',
                               table_name=table_name,
                               columns=editable_cols,
                               record=row)


@app.route('/oltp/<table_name>/delete/<int:record_id>')
def delete_record(table_name, record_id):
    if table_name not in TABLES_CONFIG:
        abort(404, f"Unknown table {table_name}")

    pk = TABLES_CONFIG[table_name]["pk"]
    query = f"DELETE FROM {table_name} WHERE {pk}=%s"

    conn = mysql.connector.connect(**OLTP_DB_CONFIG)
    cursor = conn.cursor()
    cursor.execute(query, (record_id,))
    conn.commit()
    cursor.close()
    conn.close()

    return redirect(url_for('show_table', table_name=table_name))

@app.route('/dw/fact-sales')
def show_fact_sales():
    allowed_cols = ["fact_id","date_id","product_id","manager_id","region_id","supplier_id","quantity","total_amount"]
    sort_col = request.args.get('sort')  # Напр. "product_id"
    order = request.args.get('order','asc')

    if sort_col not in allowed_cols:
        sort_col = None
    if order not in ['asc','desc']:
        order = 'asc'

    base_query = "SELECT * FROM fact_sales"
    if sort_col:
        query = f"{base_query} ORDER BY {sort_col} {order}"
    else:
        query = base_query

    conn = mysql.connector.connect(**DW_DB_CONFIG)
    cursor = conn.cursor(dictionary=True)
    cursor.execute(query)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    return render_template('dw_fact_sales.html',
                           columns=allowed_cols,
                           rows=rows,
                           sort_col=sort_col,
                           sort_order=order)


# -------------------------
# 4) ETL
# -------------------------
@app.route('/etl')
def run_etl():
    data_oltp = extract_oltp_data()
    data_transformed = transform_data(data_oltp)
    load_to_dw(data_transformed)

    return render_template('index.html', message="ETL process completed!")


# -------------------------
# 5) Діаграми
# -------------------------
def fig_to_png_bytes(fig):
    buf = io.BytesIO()
    fig.savefig(buf, format='png')
    buf.seek(0)
    return buf

@app.route('/charts')
def charts_index():

    return render_template('chart_list.html')

@app.route('/charts/line-monthly')
def chart_line_monthly():

    fig = charts.line_chart_monthly_sales(return_figure=True)
    png = fig_to_png_bytes(fig)
    plt.close(fig)  # вивільняємо ресурси
    return send_file(png, mimetype='image/png')


@app.route('/charts/bar-monthly')
def chart_bar_monthly():

    fig = charts.bar_chart_monthly_sales(return_figure=True)
    png = fig_to_png_bytes(fig)
    plt.close(fig)
    return send_file(png, mimetype='image/png')


@app.route('/charts/hist-quantity')
def chart_hist_quantity():

    fig = charts.histogram_quantity_distribution(return_figure=True)
    png = fig_to_png_bytes(fig)
    plt.close(fig)
    return send_file(png, mimetype='image/png')


@app.route('/charts/pie-category')
def chart_pie_category():

    fig = charts.pie_chart_by_category(return_figure=True)
    png = fig_to_png_bytes(fig)
    plt.close(fig)
    return send_file(png, mimetype='image/png')


@app.route('/charts/donut-supplier')
def chart_donut_supplier():

    fig = charts.donut_chart_by_supplier(return_figure=True)
    png = fig_to_png_bytes(fig)
    plt.close(fig)
    return send_file(png, mimetype='image/png')



if __name__ == '__main__':
    app.run(debug=True)
