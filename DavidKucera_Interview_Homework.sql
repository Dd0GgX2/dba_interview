-- Write a script that returns a customer name and a product name for every product in the transactions table.
SELECT C.customer_name, P.product_name
FROM dbo.customers AS C
INNER JOIN dbo.transactions AS T
ON C.customer_id = T.customer_id
INNER JOIN dbo.products AS P
ON T.product_id = P.product_id
GROUP BY C.customer_name, P.product_name

--Write a script that returns a customer name, class name, and instructor name for every class in the transactions table.

SELECT C.customer_name, CL.class_name, I.instructor_name
FROM dbo.customers AS C
INNER JOIN dbo.transactions AS T
ON C.customer_id = T.customer_id
INNER JOIN dbo.classes AS CL
ON CL.class_id = T.class_id
INNER JOIN dbo.instructors AS I
ON CL.instructor_id = I.instructor_id
GROUP BY C.customer_name, CL.class_name, I.instructor_name

--Write a script that returns only the customer name and the total amount of the products each customer purchased.
SELECT C.customer_name, COUNT(T.product_id) AS [ProductsPurchased]
FROM dbo.customers AS C
INNER JOIN dbo.transactions AS T
ON C.customer_id = T.customer_id
GROUP BY C.customer_name
HAVING COUNT(T.product_id) > 0

--Filter question 3 for customers who spent over $50.

SELECT C.customer_name, COUNT(T.product_id) AS [ProductsPurchased], SUM(P.price) AS [AmountSpent]
FROM dbo.customers AS C
INNER JOIN dbo.transactions AS T
ON C.customer_id = T.customer_id
INNER JOIN dbo.products AS P
ON T.product_id = P.product_id
GROUP BY C.customer_name
HAVING COUNT(T.product_id) > 0
AND SUM(P.Price) > 50


--Write a script that returns only the last name of the customer, the product name, and the transaction times of transactions that took place between March 1st and March 10th. Alphabatize the result.

/*
There are no eligable transactions, as all transactions took place at various points on May 1st,
however, the below query would show the correct data if such data existed
*/

SELECT RIGHT(C.customer_name, LEN(customer_name) - CHARINDEX(' ', C.customer_name)) AS [LastName], P.product_name, T.transaction_time
FROM dbo.customers AS C
INNER JOIN transactions AS T
ON C.customer_id = T.customer_id
INNER JOIN products AS P
ON P.product_id = T.product_id
WHERE T.transaction_time BETWEEN '03/01/2015' AND '03/10/2015'
ORDER BY C.customer_name


--Update the Volleyball class to start at 12pm on July 4th, 2015 and end at 4pm on July 4th, 2015.


UPDATE dbo.classes
SET start_time = '2015-07-04 12:00',
end_time = '2015-07-04 16:00'
WHERE class_name = 'volleyball tournament'

--Write a script to return all customers who have not made a transaction.
SELECT C.customer_name
FROM dbo.customers AS C
LEFT JOIN dbo.transactions AS T
ON C.customer_id = T.customer_id
WHERE T.customer_id IS NULL


--George Bush registered for the Jetski class, but is not showing up on the roster for the Jetski class. Why?

/*
There is no record of a transaction of GW paying for the class
*/

SELECT *
FROM dbo.registrations AS R

SELECT *
FROM dbo.customers AS C
INNER JOIN dbo.transactions AS T
ON T.customer_id = C.customer_id
--INNER JOIN classes AS Cl
--ON Cl.class_id = T.class_id
WHERE C.customer_name = 'George Washington'

--Write a script that searches the customers table for possible duplicates.

SELECT customer_name, COUNT(*) AS [NumberOfRecords]
FROM dbo.customers AS C
GROUP BY customer_name
HAVING COUNT(*) > 1
--Store SQL scripts you used to answer the above in a file and commit it back to this repo in a folder labeled as follows: yourname_interview_homework (Tip: you may use any resource at your disposal if you are unfamilar with how to make a commit to a git repo)