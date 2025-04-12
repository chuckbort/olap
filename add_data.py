import csv

INPUT_CSV = 'fact_sales.csv'
OUTPUT_SQL = 'insert_dim_product_odku.sql'

def convert_category_id_to_name(cat_id):
    return f"Category #{cat_id}"

with open(INPUT_CSV, 'r', encoding='utf-8') as fin, open(OUTPUT_SQL, 'w', encoding='utf-8') as fout:
    reader = csv.DictReader(fin)

    fout.write('-- INSERT with ON DUPLICATE KEY UPDATE for dim_product\n\n')

    for row in reader:
        product_id = row['product_id']
        supplier_id = row['supplier_id']
        cost = row['cost']  # припускаємо, що це price
        cat_id = row['category_id']

        product_name = f"Product #{product_id}"
        category_name = convert_category_id_to_name(cat_id)

        insert_sql = (
            "INSERT INTO dim_product (product_id, product_name, category_name, supplier_id, price)\n"
            f"VALUES ({product_id}, '{product_name}', '{category_name}', {supplier_id}, {cost})\n"
            "ON DUPLICATE KEY UPDATE\n"
            "  product_name=VALUES(product_name),\n"
            "  category_name=VALUES(category_name),\n"
            "  supplier_id=VALUES(supplier_id),\n"
            "  price=VALUES(price);"
        )

        fout.write(insert_sql + "\n")

    fout.write("\n-- END\n")

print("[OK] Generated insert_dim_product_odku.sql with ON DUPLICATE KEY UPDATE.")
