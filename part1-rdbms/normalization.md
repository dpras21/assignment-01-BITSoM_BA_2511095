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
