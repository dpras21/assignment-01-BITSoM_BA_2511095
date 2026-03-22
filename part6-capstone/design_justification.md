## STORAGE SYSTEMS 
The system uses multiple storage layers based on the type of workload.Transactional hospital data such as patient records, admissions, and treatments are stored in an OLTP database like PostgreSQL. This system supports fast inserts and updates required for daily hospital operations.For real-time ICU monitoring devices, streaming ingestion is handled using Kafka. This allows continuous ingestion of vitals data like heart rate, oxygen level, and blood pressure.

All raw structured and unstructured data is stored in a Data Lake such as Amazon S3. This includes PDFs, doctor notes, sensor logs, and historical datasets. The data lake enables scalable and low-cost storage.For reporting and business intelligence needs, cleaned and aggregated data is loaded into a Data Warehouse such as Snowflake or BigQuery. This supports monthly management reports like bed occupancy trends and department-wise cost analysis.To enable natural language search by doctors, a Vector Database such as FAISS or Pinecone is used. Patient notes and reports are converted into embeddings and stored for semantic retrieval.Machine learning models for readmission prediction use features prepared from warehouse and lake data.


## OLTP vs OLAP Boundary 
The OLTP system includes real-time transactional hospital applications such as patient registration, treatment updates, and billing systems. These systems prioritize consistency and fast transaction processing.

Once data is generated in OLTP systems, it is streamed or batch-loaded into the data lake where analytical processing begins. The OLAP boundary starts at the data lake and warehouse layers, where data is transformed, aggregated, and used for reporting and machine learning workloads.

This separation ensures that analytical queries do not impact operational hospital systems.


## Trade-Offs
One significant trade-off in this architecture is increased system complexity due to multiple storage systems. Managing data pipelines between OLTP databases, streaming platforms, data lakes, and warehouses requires proper orchestration and monitoring.

To mitigate this, workflow orchestration tools like Apache Airflow can be used to automate ETL pipelines. Additionally, centralized data cataloging and governance tools help maintain data quality and lineage.

Despite complexity, this architecture provides scalability, flexibility, and supports AI-driven healthcare use cases effectively.
