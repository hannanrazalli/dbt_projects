import json
import csv
import glob
import os

# 1. Cari semua fail JSON yang bermula dngn 'part-'
json_files = glob.glob("part-*.json")
output_file = "raw_transactions.csv"

header = ["txn_id", "cust_id", "amount", "points", "is_member", "status", "txn_date"]

with open(output_file, 'w', newline='') as f_output:
    writer = csv.DictWriter(f_output, fieldnames=header)
    writer.writeheader()

    for file in json_files:
        print(f"Processing {file}...")
        with open(file, 'r') as f_input:
            for line in f_input:
                # Load JSON dan tulis ke CSV
                data = json.loads(line)
                # Ensure missing columns (macam amount) jadi blank dlm CSV
                writer.writerow({col: data.get(col, "") for col in header})

print(f"Siap! Fail {output_file} telah dijana.")