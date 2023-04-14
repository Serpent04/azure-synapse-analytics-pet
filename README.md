This project's goal was to conduct simple analytics on NYC Taxi data fully in Azure Synapse Analytics from scratch.
Raw data is taken from www.nyc.gov. 
The tools used include Azure Synapse Analytics, ADLS Gen2, Microsoft Power BI.

Key stages:
- Created a resource group that includes Synapse Workspace, ADLS Gen2 storage account.
- Uploaded data to ADLS Gen2 container.
- Ingested data to Synapse Workspace.
- Discovered data.
- Processed raw data all the way to gold tier using Serverless SQL Pool.
- Created stored procedures and CETAS scripts.
- Gathered the whole process into a single automated pipeline in Synapse Pipelines.
- Connected a Power BI dashboard to the Storage Account and created a sample dashboard.
