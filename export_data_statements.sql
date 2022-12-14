#export csv file of all employees (save as chinook_employee)
SELECT * FROM chinook_dw.dim_employee;

#export json file of all products. Make sure to make limit of # of rows to 5,000 (save as chinook_product)
SELECT * FROM chinook_dw.dim_product;

#export json file of each of these 4 for hot-path streaming purposes in azure
SELECT * FROM chinook_dw.fact_invoice
WHERE customer_key BETWEEN 1 AND 15;

SELECT * FROM chinook_dw.fact_invoice
WHERE customer_key BETWEEN 16 AND 30;

SELECT * FROM chinook_dw.fact_invoice
WHERE customer_key BETWEEN 31 AND 45;

SELECT * FROM chinook_dw.fact_invoice
WHERE customer_key BETWEEN 46 AND 59;

