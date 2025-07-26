# EDA Process 
select * from customer_data;
 
# Total number of records
SELECT COUNT(*) AS total_customers FROM customer_data;

UPDATE customer_data
SET Gender = CASE
                WHEN Gender = 'M' THEN 'Male'
                WHEN Gender = 'F' THEN 'Female'
                ELSE Gender
            END
WHERE Gender IN ('M', 'F');



 UPDATE customer_data
 SET Marital_status=
 CASE 
	  WHEN Marital_Status='M' then 'Married'
	  WHEN Marital_Status='S' then 'Single'
      ELSE Marital_status
 END
 WHERE Marital_Status IN('M','S');

# Total buyers vs non-buyers
SELECT Purchased_Bike, COUNT(*) AS count
FROM customer_data
GROUP BY Purchased_Bike;

# Bike purchases Based on Gender
SELECT Gender, 
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Purchased_Bike = 'Yes' THEN 1 ELSE 0 END) AS buyers,
       ROUND(100.0 * SUM(CASE WHEN Purchased_Bike = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS buy_percent
FROM customer_data
GROUP BY Gender;

# Bike Sales by Region
SELECT Region,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Purchased_Bike = 'Yes' THEN 1 ELSE 0 END) AS buyers,
       ROUND(100.0 * SUM(CASE WHEN Purchased_Bike = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS buy_percent
FROM customer_data
GROUP BY Region
ORDER BY buyers DESC;

# Bike Purchases by Education Level 
SELECT Education,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Purchased_Bike = 'Yes' THEN 1 ELSE 0 END) AS buyers,
       ROUND(100.0 * SUM(CASE WHEN Purchased_Bike = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS buy_percent
FROM customer_data
GROUP BY Education
ORDER BY buyers DESC;

# Customer Occupation and Bike Purchase Rate
SELECT Occupation,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Purchased_Bike = 'Yes' THEN 1 ELSE 0 END) AS buyers,
       ROUND(100.0 * SUM(CASE WHEN Purchased_Bike = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS buy_percent
FROM customer_data
GROUP BY Occupation
ORDER BY buyers DESC;

# Relationship Between Car Ownership and Bike Purchase
SELECT Cars,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Purchased_Bike = 'Yes' THEN 1 ELSE 0 END) AS buyers,
       ROUND(100.0 * SUM(CASE WHEN Purchased_Bike = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS buy_percent
FROM customer_data
GROUP BY Cars
ORDER BY Cars;

# Bike Purchase Rate by Commute Distance
SELECT Commute_Distance,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Purchased_Bike = 'Yes' THEN 1 ELSE 0 END) AS buyers,
       ROUND(100.0 * SUM(CASE WHEN Purchased_Bike = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS buy_percent
FROM customer_data
GROUP BY Commute_Distance
ORDER BY buy_percent DESC;

SELECT *
FROM customer_data
WHERE Gender = 'f'
  AND Age between 30 and 40
  AND Children > 1
  AND Purchased_Bike = 'Yes';


