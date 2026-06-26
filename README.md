# Zepto SQL Data Analysis

## Project Overview

This project analyzes a Zepto product dataset using PostgreSQL. The objective is to perform data cleaning, exploratory data analysis (EDA), and business analysis to generate actionable insights from retail product data.

## Dataset

The dataset contains product-level information including:

* Product Name
* Category
* MRP
* Discount Percentage
* Selling Price
* Available Quantity
* Stock Status
* Weight
* Quantity

## Technologies Used

* PostgreSQL
* pgAdmin 4
* SQL

## Data Cleaning

* Created database and table
* Checked dataset import
* Identified NULL values
* Removed invalid records
* Converted prices from paise to rupees
* Verified cleaned dataset

## Business Questions Solved

* Total number of products
* Products by category
* Average MRP by category
* Highest discount product
* Top 10 expensive products
* Out-of-stock products
* Total savings by category
* Top revenue-generating products
* Product ranking using Window Functions
* Revenue by category
* High-discount low-stock products
* Stock status using CASE statements

## SQL Concepts Used

* SELECT
* WHERE
* GROUP BY
* HAVING
* ORDER BY
* Aggregate Functions
* CASE
* Window Functions (RANK)
* Data Cleaning
* Business Analysis

## Key Insights

* Identified top-performing product categories.
* Calculated potential revenue using product quantity and selling price.
* Measured category-wise customer savings.
* Ranked premium products based on MRP.
* Flagged products with high discounts but low inventory for potential restocking.

## Author

Aniket 
Aspiring Data Analyst
