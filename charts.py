import mysql.connector
import matplotlib
import matplotlib.pyplot as plt
import numpy as np

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'MyPass123',
    'database': 'bi_dw_db'
}

def get_connection():
    return mysql.connector.connect(**db_config)


def line_chart_monthly_sales(return_figure=False):
    conn = get_connection()
    cursor = conn.cursor()

    query = """
        SELECT d.year,
               d.month,
               SUM(fs.total_amount) AS monthly_sales
        FROM fact_sales fs
        JOIN dim_date d ON fs.date_id = d.date_id
        GROUP BY d.year, d.month
        ORDER BY d.year, d.month
    """
    cursor.execute(query)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    x_labels = []
    y_values = []
    for (year_, month_, sales_) in rows:
        label = f"{year_}-{str(month_).zfill(2)}"
        x_labels.append(label)
        y_values.append(float(sales_))

    fig, ax = plt.subplots()
    ax.plot(x_labels, y_values, marker='o')
    ax.set_title("Динаміка продажів за місяцями")
    ax.set_xlabel("Місяці (YYYY-MM)")
    ax.set_ylabel("Сума продажів")
    plt.setp(ax.get_xticklabels(), rotation=45)  # повернути підписи
    plt.tight_layout()

    if return_figure:
        return fig
    else:
        plt.show()


def bar_chart_monthly_sales(return_figure=False):
    conn = get_connection()
    cursor = conn.cursor()

    query = """
        SELECT d.year,
               d.month,
               SUM(fs.total_amount) AS monthly_sales
        FROM fact_sales fs
        JOIN dim_date d ON fs.date_id = d.date_id
        GROUP BY d.year, d.month
        ORDER BY d.year, d.month
    """
    cursor.execute(query)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    x_labels = []
    y_values = []
    for (year_, month_, sales_) in rows:
        label = f"{year_}-{str(month_).zfill(2)}"
        x_labels.append(label)
        y_values.append(float(sales_))

    fig, ax = plt.subplots()
    ax.bar(x_labels, y_values)
    ax.set_title("Обсяг продажів за місяцями")
    ax.set_xlabel("Місяці (YYYY-MM)")
    ax.set_ylabel("Сума продажів")
    plt.setp(ax.get_xticklabels(), rotation=45)
    plt.tight_layout()

    if return_figure:
        return fig
    else:
        plt.show()


def histogram_quantity_distribution(return_figure=False):
    conn = get_connection()
    cursor = conn.cursor()

    query = """
        SELECT p.price
        FROM dim_product p
        WHERE p.price IS NOT NULL
    """
    cursor.execute(query)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    # В rows маємо [(25.5,), (30.0,), ...]. Перетворимо в список
    prices = [row[0] for row in rows]

    # Будуємо гістограму
    fig, ax = plt.subplots()
    ax.hist(prices, bins=10)
    ax.set_title("Розподіл ціни (price) у dim_product")
    ax.set_xlabel("Ціна")
    ax.set_ylabel("Кількість продуктів")

    if return_figure:
        return fig
    else:
        plt.show()



def pie_chart_by_category(return_figure=False):
    conn = get_connection()
    cursor = conn.cursor()

    query = """
        SELECT p.category_name,
               SUM(fs.total_amount) AS total_sales
        FROM fact_sales fs
        JOIN dim_product p ON fs.product_id = p.product_id
        GROUP BY p.category_name
        ORDER BY total_sales DESC
    """
    cursor.execute(query)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    labels = []
    values = []
    for (cat, sales_) in rows:
        labels.append(cat if cat else "Unknown")
        values.append(float(sales_))

    fig, ax = plt.subplots()
    ax.pie(values, labels=labels, autopct='%1.1f%%')
    ax.set_title("Розподіл продажів за категоріями")

    if return_figure:
        return fig
    else:
        plt.show()


def donut_chart_by_supplier(return_figure=False):
    conn = get_connection()
    cursor = conn.cursor()

    query = """
        SELECT s.supplier_name,
               SUM(fs.total_amount) AS total_sales
        FROM fact_sales fs
        JOIN dim_supplier s ON fs.supplier_id = s.supplier_id
        GROUP BY s.supplier_name
        ORDER BY total_sales DESC
    """
    cursor.execute(query)
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    labels = []
    values = []
    for (sup, sales_) in rows:
        labels.append(sup if sup else "Unknown")
        values.append(float(sales_))

    fig, ax = plt.subplots()
    wedges, texts, autotexts = ax.pie(values, labels=labels, autopct='%1.1f%%')

    centre_circle = plt.Circle((0, 0), 0.70, fc='white')
    ax.add_artist(centre_circle)

    ax.set_title("Розподіл продажів серед постачальників (Donut)")

    if return_figure:
        return fig
    else:
        plt.show()


if __name__ == "__main__":

    line_chart_monthly_sales()
    bar_chart_monthly_sales()
    histogram_quantity_distribution()

    pie_chart_by_category()
    donut_chart_by_supplier()
