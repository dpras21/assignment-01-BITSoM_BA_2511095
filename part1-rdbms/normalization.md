## Anomaly Analysis
### Insert Anomaly
In the orders_flat table, we cannot insert a new customer or product unless an order is also created.
For example:
If a new customer wants to register but has not placed any order yet, we cannot insert their details because order_id, product_id and quantity fields are mandatory.
Similarly, if a new product like product_id P009 (Printer) needs to be added but no order has been placed, it cannot be stored in the table.
Columns involved:
order_id, customer_id, product_id, quantity

### Update Anomaly
If the unit_price of a product changes, it must be updated in multiple rows.
For example:
Product “Pen Set” with product_id P007 appears in multiple rows such as:
- order_id ORD1114  
- order_id ORD1153  
- order_id ORD1132  
If the price changes from 250 to 300, we must update all these rows.  
If one row is missed, inconsistent pricing data will exist.
Columns involved:
product_id, unit_price

### Delete Anomaly
If we delete a row representing the only order of a customer, all customer information will also be lost.
For example:
If we delete order_id ORD1075 which belongs to customer Vikram Singh (customer_id C005), and this is his only order, then his name, email and city details will also be removed from the database.
Columns involved:
order_id, customer_id, customer_name, city

## Normalization Justification
Keeping all order-related information such as customer details, product details, pricing, and sales representative data in a single flat table like orders_flat may seem simple but leads to serious data management problems. In the dataset, customer information such as name, email, and city is repeated in multiple rows whenever the same customer places multiple orders. For example, customer Neha Gupta (C006) appears in several rows with identical details. This redundancy increases storage usage and creates update anomalies. If Neha changes her email or city, the change must be made in every row. Missing even one row will result in inconsistent data.

Similarly, product pricing issues can arise. The product “Pen Set” (P007) appears in multiple orders such as ORD1114, ORD1153, and ORD1132. If the unit price changes from 250 to 300, all related rows must be updated manually. This increases the risk of data inconsistency and makes maintenance difficult.

There are also insert anomalies, where new customers or products cannot be added unless an order is created. For instance, adding a new product like a Printer (P009) without any order is not possible in the flat structure.

Additionally, delete anomalies may lead to loss of important information. Deleting the only order of customer Vikram Singh (C005) would also remove his customer details from the database.

By normalizing the schema into separate tables such as Customers, Products, Orders, Sales Representatives, and Order Details (3NF), redundancy is reduced, data integrity is improved, and the database becomes more scalable and efficient. Therefore, normalization is essential rather than over-engineering.
