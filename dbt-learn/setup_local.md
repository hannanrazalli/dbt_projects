cd C:\Users\HP\Documents\GitHub\dbt_projects

mkdir dbt-learn

cd dbt-learn

python -m venv venv

venv\Scripts\activate

pip install dbt-postgres

dbt --version

dbt init practice1_medallion

1

C:\Users\HP\.dbt\profiles.yml

practice1_medallion: # Nama ni mesti SAMA dlm dbt_project.yml kau
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      user: postgres
      password: 1234
      port: 5432
      dbname: practice1
      Postgres kau
      schema: dbt_bronze1
      threads: 4

buka guna VS Code
C:\Users\HP\Documents\GitHub\dbt_projects\dbt-learn\practice1_medallion

Padam folder models/example (tak payah guna contoh dbt).
Dalam folder models/, buat 3 folder baru:
1_bronze (Data mentah dari Postgres)
2_silver (Data yang dah bersih & joined)
3_gold (Table final untuk reporting)

cd C:\Users\HP\Documents\GitHub\dbt_projects\dbt-learn

venv\Scripts\activate

cd practice1_medallion