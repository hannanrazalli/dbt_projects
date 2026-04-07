1) Step 1:
# IAM & Admin > Service Accounts

# Create service account > (Fill service account name & description ) > Create and Continue

# Permission: Owner > Continue >(Leave Principal with access blank) > Done

# Click service account email > Keys > Add key > Create new key > JSON > Create (It will save file in download folder to be use in dbt project)



2) Step 2:
# Account settings > Projects > Click new project



3) Step 3:
# Connections > BigQuery > Upload a Service Account JSON file (From step 1) > Test Connection > Next