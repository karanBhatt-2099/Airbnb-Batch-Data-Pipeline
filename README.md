Airbnb Batch Data Pipeline

Overview
This project demonstrates an end-to-end batch data engineering pipeline for Airbnb-style datasets using a modern cloud-native stack.

The pipeline follows the Medallion Architecture pattern:

Bronze Layer → Raw ingested data
Silver Layer → Cleaned and transformed data
Gold Layer → Business-ready analytical models (Star Schema)

The implementation uses:

Amazon Web Services S3 for storage
Snowflake as the warehouse
dbt Labs for transformations
GitHub for version control

Key Features

End-to-end batch data pipeline implementation
Medallion Architecture (Bronze, Silver, Gold layers)
Cloud-native architecture using AWS and Snowflake
Incremental loading with dbt
Metadata-driven transformation pipelines
Star Schema dimensional modeling
Slowly Changing Dimension (SCD Type-2) implementation

Architecture Overview

The pipeline follows a layered Medallion Architecture to ensure data quality, scalability, and maintainability.

Data Flow
Raw CSV files are uploaded to AWS S3 buckets.
Snowflake external stages are created to access S3 data.
Raw datasets are loaded into Bronze layer tables.
dbt transforms and cleans data into the Silver layer.
Business-ready Gold layer models are created using Star Schema design.
Analytical datasets become available for reporting and BI tools.

Conclusion

This Airbnb Batch Data Pipeline project demonstrates how modern data engineering systems are built using scalable cloud-native technologies. By combining AWS S3, Snowflake, and dbt, the project creates a reliable and production-ready analytics pipeline capable of handling structured batch workloads efficiently.

The implementation also introduces essential industry concepts such as Medallion Architecture, incremental processing, metadata-driven transformations, SCD Type-2 tracking, and Star Schema modeling, making it an excellent hands-on project for aspiring and professional data engineers.
Automated data quality testing
Modular and scalable dbt project structure
Git-based version control and collaboration
