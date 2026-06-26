drop table if exists zepto;
create table zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,	
quantity INTEGER
);
---COUNT THE ROWS ARE PRESENT IN THE DATASET
count(*) from zepto;

---check our dataseet is imported or not
S *from zepto
limit 10;

---check hw many values are null in the dataset
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

---check how many products are in out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

---How many product are apears multiple times in the dataset
SELECT name , COUNT(sku_id)  as "Number of SKUs"
FROM zepto
GROUP BY name 
HAVING count (sku_id)>1
ORDER BY count (sku_id) DESC;

---DATA CLEANING 

--check where any column have null values or 0. price=0;

SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

--- delete this row
DELETE FROM zepto 
WHERE mrp = 0;
--- convert the price of paise to rupees

UPDATE zepto
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

---now lets check the price wil convert into ruppee or not

SELECT name,mrp, discountedSellingPrice FROM zepto

---BUSINESS QUESTIONS

1---Total number of products
SELECT COUNT(*) AS total_products
FROM zepto;

2---Count products by category
SELECT
category,
COUNT(*) AS total_products
FROM zepto
GROUP BY category
ORDER BY total_products DESC;

3---Average MRP by category
SELECT
    category,
    ROUND(AVG(mrp),2) AS avg_mrp
FROM zepto
GROUP BY category
ORDER BY avg_mrp DESC;

4---Highest discount product
SELECT
    name,
    category,
    mrp,
    discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 1;


5---Top 10 expensive products
SELECT
    name,
    category,
    mrp
FROM zepto
ORDER BY mrp DESC
LIMIT 10;

6---Out-of-stock products
SELECT
    name,
    category,
    mrp
FROM zepto
WHERE outOfStock = TRUE;


7---Total savings by category
SELECT
    category,
    ROUND(SUM(mrp - discountedSellingPrice),2) AS total_savings
FROM zepto
GROUP BY category
ORDER BY total_savings DESC;

8---Top revenue-generating products
SELECT
    name,
    category,
    discountedSellingPrice,
    quantity,
    (discountedSellingPrice * quantity) AS revenue
FROM zepto
ORDER BY revenue DESC
LIMIT 10;

9---CASE statement for stock status
SELECT
    name,
    availableQuantity,
    CASE
        WHEN outOfStock = TRUE THEN 'Out of Stock'
        WHEN availableQuantity < 20 THEN 'Low Stock'
        ELSE 'In Stock'
    END AS stock_status
FROM zepto;


10---Rank products by MRP
SELECT
    name,
    category,
    mrp,
    RANK() OVER(ORDER BY mrp DESC) AS product_rank
FROM zepto;


---Top 5 Categories by Revenue
SELECT
    category,
    ROUND(SUM(discountedSellingPrice * quantity),2) AS revenue
FROM zepto
GROUP BY category
ORDER BY revenue DESC
LIMIT 5;


---Products with High Discount but Low Stock
SELECT
    name,
    category,
    discountPercent,
    availableQuantity
FROM zepto
WHERE discountPercent >= 30
  AND availableQuantity < 20
ORDER BY discountPercent DESC;


























































