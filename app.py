import mysql
import mysql.connector
from flask import Flask, request, jsonify

app = Flask(__name__)

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'MyPass123',
    'database': 'oltp_db'
}

connection = mysql.connector.connect(
  user='root',
  password='MyPass123',
  host='localhost',
  database='oltp_db',
)

# Перегляд (Read) усіх записів:
@app.route('/sales', methods=['GET'])
def get_sales():
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT * FROM sales")
    results = cursor.fetchall()
    cursor.close()
    connection.close()
    return jsonify(results)

# Додавання (Create) нового запису:
@app.route('/sales', methods=['POST'])
def add_sale():
    data = request.json
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor()
    sql = """INSERT INTO sales (sale_date, product_id, manager_id, region, quantity, total_amount)
             VALUES (%s, %s, %s, %s, %s, %s)"""
    vals = (
        data['sale_date'],
        data['product_id'],
        data['manager_id'],
        data['region'],
        data['quantity'],
        data['total_amount']
    )
    cursor.execute(sql, vals)
    connection.commit()
    cursor.close()
    connection.close()
    return jsonify({"message": "Sale added successfully"}), 201

# Редагування (Update) запису:
@app.route('/sales/<int:sale_id>', methods=['PUT'])
def update_sale(sale_id):
    data = request.json
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor()
    sql = """UPDATE sales
             SET sale_date = %s,
                 product_id = %s,
                 manager_id = %s,
                 region = %s,
                 quantity = %s,
                 total_amount = %s
             WHERE sale_id = %s"""
    vals = (
        data['sale_date'],
        data['product_id'],
        data['manager_id'],
        data['region'],
        data['quantity'],
        data['total_amount'],
        sale_id
    )
    cursor.execute(sql, vals)
    connection.commit()
    cursor.close()
    connection.close()
    return jsonify({"message": "Sale updated successfully"})

# Видалення (Delete) запису:
@app.route('/sales/<int:sale_id>', methods=['DELETE'])
def delete_sale(sale_id):
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor()
    cursor.execute("DELETE FROM sales WHERE sale_id = %s", (sale_id,))
    connection.commit()
    cursor.close()
    connection.close()
    return jsonify({"message": "Sale deleted successfully"})

if __name__ == '__main__':
    app.run(debug=True)
