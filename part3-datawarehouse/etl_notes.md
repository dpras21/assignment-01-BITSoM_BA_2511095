## ETL Decisions

### Decision 1 — Date Cleaning
Problem: Date column was not visible properly in Excel (#### format) and had inconsistent formats.
Resolution: Standardized all dates and extracted only month and year for building dim_date.

### Decision 2 — Category Standardization
Problem: Categories appeared as "electronic", "Electronic", "electronics", "Grocery", "Groceries".
Resolution: Converted all category values into proper standardized names like Electronics, Clothing, Grocery.

### Decision 3 — Revenue Calculation
Problem: Raw data did not contain total revenue column.
Resolution: Created a derived field revenue = units_sold × unit_price before loading into fact table.
