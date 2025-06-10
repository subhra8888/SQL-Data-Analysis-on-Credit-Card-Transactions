# 🧮 SQL Credit Card Transactions Analysis
This project focuses on analyzing credit card transaction data using SQL queries to derive insights and trends. It involves the implementation of various queries to explore spending patterns, card types, cities, and different transaction attributes. The dataset includes transactions across different cities, card types, and expense categories.

## 📊 Project Overview
- Transaction details
- City information
- Card types (Gold, Silver, Platinum, etc.)
- Expense categories
- Date and time of transactions

## 🛠️ Technologies Used
- 🗃️ SQL Server
- 📊 Relational Database Concepts
- 📝 Window Functions, CTEs, Aggregations, Date Functions

## 🧾 Key Business Queries
### 1. Top 5 Cities with Highest Spends and Contribution %
 - Identifies the top 5 cities by total spending.
 - Calculates each city’s contribution percentage of total credit card spends.
### 2. Highest Spend Month per Card Type
 - Finds the month with the highest total expense for each credit card type.
### 3. Transactions at ₹1,000,000 Cumulative Spend per Card Type
 - Retrieves the transaction where each card type reaches ₹1,000,000 in cumulative spends.
### 4. City with Lowest Gold Card Spend Percentage
 - Determines the city where the gold card contributes the least to overall spending.
### 5. Highest & Lowest Expense Type per City
 - Lists the highest and lowest expense types for each city.
### 6. Female Spend Contribution per Expense Type
 - Calculates the percentage of spending done by female customers across expense categories.
### 7. Max MoM Growth in Jan 2014 by Card & Expense Type
 - Analyzes month-over-month (MoM) growth and identifies the card and expense type combo with the highest growth in January 2014.
### 8. Highest Spend Month per Card Type
 - Compares total weekend spending to the number of weekend transactions to find the most lucrative city.
### 9. Fastest City to 500 Transactions
 - Identifies which city reached its 500th transaction in the shortest time span after its first transaction.
   
## 🔍 Project Insight
### 1. Top 5 Cities by Spend and Their % Contribution
   - Output: Greater Mumbai – 14.15%
### 2. Highest Spend Month by Card Type
 - Output: Gold Card: Highest spend in January 2015
### 3. City with Lowest % Spend for Gold Card
 - Output: Dhamtari contributes only 0.33% of total Gold card spending.
### 4. City-wise Expense Category Trends
 - Output: Achalpur – Highest: Grocery, Lowest: Entertainment
### 5. Highest MoM Growth in Jan-2014 (Card + Expense Type)
 - Output: Gold + Travel combination showed highest month-over-month growth in Jan 2014, with 0.88% growth
### 6. Best Weekend Spender City (Spend per Transaction Ratio)
 - Sonepur has the highest spend-to-transaction ratio on weekends
### 7. City Fastest to Reach 500 Transactions
 - Bengaluru hit 500 transactions in just 81 days.
   
## 🗃️ Dataset
[Download Dataset CSV](https://github.com/subhra8888/SQL-Data-Analysis-on-Credit-Card-Transactions/blob/main/credit_card_transcations.csv)
