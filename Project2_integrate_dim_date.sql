#WARNING: DO NOT implement this file before fact_invoices has been created!
#Run Project1_python_ETL.ipynb file first.

USE chinook_dw;

# ==============================================================
# Add New Column
# ==============================================================
ALTER TABLE chinook_dw.fact_invoices
ADD COLUMN invoice_date_key int NOT NULL AFTER InvoiceDate;


# ==============================================================
# Update New Column with value from Dimension table
# ==============================================================

UPDATE chinook_dw.fact_invoices AS fi
JOIN chinook_dw.dim_date AS dd
ON DATE(fi.InvoiceDate) = dd.full_date
SET fi.invoice_date_key = dd.date_key;


# ==============================================================
# Validate that newly updated columns contain valid data
# ==============================================================

SELECT * FROM chinook_dw.fact_invoices;

# =============================================================
# If values are correct then drop old column(s)
# =============================================================
ALTER TABLE chinook_dw.fact_invoices
DROP COLUMN InvoiceDate;

# =============================================================
# Validate Finished Fact Table.
# =============================================================
SELECT * FROM chinook_dw.fact_invoices;
