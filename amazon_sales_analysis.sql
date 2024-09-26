### Analysing Mock Amazon Sales in England
## I generated a mock dataset as detailed sales data is not publicy available, the data is not realistic.
## Using the following categories which are based on Amazons' website: Books, Electronics, Home Appliance, Fashion, Toys, Health and Beauty, Sports, and Furniture
## Maximum product quantity I set to 10. Price I set to be minimum £5 and maximum £500
## Amazons' approved payment methods are credit cards, debit cards, amazon pay, and gift cards
## If you don't have a prime account delivery is randomised between £0-5

# Viewing data set
SELECT *
FROM amazon_sales; 

# Cleaning data by ordering sales from oldest to newest
SELECT *
FROM amazon_sales
ORDER BY STR_TO_DATE(order_date, '%d/%m/%Y') ASC;

# No. of orders, total sales, average sales and no. of unique customers
SELECT COUNT(order_id) AS total_orders, SUM(total_sales) AS total_revenue, AVG(total_sales) AS avg_order_value, COUNT(DISTINCT customer_id) AS unique_customers 
FROM amazon_sales;

# Monthly sales
SELECT YEAR(STR_TO_DATE(order_date, '%m/%d/%Y')) AS year, MONTH(STR_TO_DATE(order_date, '%m/%d/%Y')) AS month, SUM(total_sales) AS monthly_sales
FROM amazon_sales
GROUP BY year, month
ORDER BY year, month;

# No. of prime subscription
SELECT prime_subscription, COUNT(customer_id)
FROM amazon_sales
GROUP BY prime_subscription;

# Amount spent on delivery
SELECT SUM(delivery_cost) AS total_delivery_cost
FROM amazon_sales;

# Highest sales revenue region
SELECT region, SUM(total_sales) AS total_revenue
FROM amazon_sales
GROUP BY region
ORDER BY total_revenue DESC;
 
 # Highest orders count
SELECT region, COUNT(order_id) AS total_orders
FROM amazon_sales
GROUP BY region
ORDER BY total_orders DESC;

# Most used payment method
SELECT payment_method, COUNT(order_id), SUM(total_sales) AS total_sales
FROM amazon_sales
GROUP BY payment_method
ORDER BY total_sales DESC;

# Top 10 largest orders
SELECT * 
FROM amazon_sales
ORDER BY total_sales DESC
LIMIT 10;

# Top 10 highest delivery cost areas
SELECT region, AVG(delivery_cost) AS avg_delivery_cost
FROM amazon_sales
GROUP BY region
ORDER BY avg_delivery_cost DESC
LIMIT 10;

