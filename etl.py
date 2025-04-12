import mysql.connector
from datetime import datetime

oltp_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'MyPass123',
    'database': 'oltp_db'
}

dw_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'MyPass123',
    'database': 'bi_dw_db'
}

def extract_oltp_data():
    connection = mysql.connector.connect(**oltp_config)
    cursor = connection.cursor(dictionary=True)

    query = """
        SELECT
            s.sale_id,
            s.sale_date,
            s.region,
            s.quantity,
            p.product_id,
            p.supplier_id,
            p.category AS category_name,
            p.price AS product_price,
            m.manager_id
        FROM sales s
        JOIN products p ON s.product_id = p.product_id
        JOIN managers m ON s.manager_id = m.manager_id
    """
    cursor.execute(query)
    rows = cursor.fetchall()

    cursor.close()
    connection.close()

    return rows


def transform_data(rows):

    transformed = []
    for row in rows:
        # Припустимо, sale_date у форматі 'YYYY-MM-DD'
        dt_obj = datetime.strptime(str(row['sale_date']), '%Y-%m-%d')
        date_id = int(dt_obj.strftime('%Y%m%d'))

        quantity = row['quantity']
        product_price = row['product_price']
        total_amount = quantity * product_price

        transformed.append({
            'sale_id': row['sale_id'],
            'date_id': date_id,
            'product_id': row['product_id'],
            'supplier_id': row['supplier_id'],
            'manager_id': row['manager_id'],
            'region': row['region'],
            'quantity': quantity,
            'total_amount': total_amount,
            'category_name': row['category_name']
        })
    return transformed


def load_to_dw(transformed_data):
    dw_connection = mysql.connector.connect(**dw_config)
    dw_cursor = dw_connection.cursor()

    insert_query = """
        INSERT INTO fact_sales
        (date_id, product_id, manager_id, region_id, supplier_id, quantity, total_amount)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """

    for row in transformed_data:
        region_id = get_region_id(dw_cursor, row['region'])

        data_tuple = (
            row['date_id'],
            row['product_id'],
            row['manager_id'],
            region_id,
            row['supplier_id'],
            row['quantity'],
            row['total_amount']
        )

        dw_cursor.execute(insert_query, data_tuple)

    dw_connection.commit()
    dw_cursor.close()
    dw_connection.close()
    print("Data loaded into DW successfully!")


def get_region_id(cursor, region_str):

    sel_q = "SELECT region_id FROM dim_region WHERE region_name = %s"
    cursor.execute(sel_q, (region_str,))
    row = cursor.fetchone()
    if row:
        return row[0]
    else:
        ins_q = "INSERT INTO dim_region (region_name) VALUES (%s)"
        cursor.execute(ins_q, (region_str,))
        return cursor.lastrowid


if __name__ == "__main__":
    data_oltp = extract_oltp_data()
    print(f"Extracted {len(data_oltp)} rows from OLTP.")

    data_transformed = transform_data(data_oltp)
    print("Transformed data successfully.")

    load_to_dw(data_transformed)
    print("ETL process completed!")
