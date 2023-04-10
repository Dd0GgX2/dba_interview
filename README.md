# DBA Interview Homework
contains information needed for the homework assignment associated with the dba interview

### Setup Instructions
Pull down this repo to your local machine.

Use a tool of your choice to create a database from homerwork.sql 

Write SQL statements to answer each question below. The sql statements you write should execute without errors and should be written as if they were going to be run in a production environment. You can use any resources you would like to answer these questions, excluding talking to other human-beings in any form or fashion.

### Questions
1. Write a script that returns a customer name and a product name for every product in the transactions table.
2. Write a script that returns a customer name, class name, and instructor name for every class in the transactions table.
3. Write a script that returns only the customer name and the total amount of the products each customer purchased.
4. Filter question 3 for customers who spent over $50.
5. Write a script that returns only the last name of the customer, the product name, and the transaction times of transactions that took place between March 1st and March 10th. Alphabatize the result.
6. Update the Volleyball class to start at 12pm on July 4th, 2015 and end at 4pm on July 4th, 2015.
7. Write a script to return all customers who have not made a transaction.
8. George Bush registered for the Jetski class, but is not showing up on the roster for the Jetski class. Why?
9. Store SQL scripts you used to answer the above in a file and commit it back to this repo in a folder labeled as follows: yourname_interview_homework (Tip: you may use any resource at your disposal if you are unfamilar with how to make a commit to a git repo)



## Bonus Points
Answering these questions is not necessary, but would be impressive. 

1. Code Troubleshooting
The monitoring service contains a job that queries a database to gather information pertaining to database activity. An email is sent every Monday morning and contains information for the last 7 days. In testing, an engineer noticed that the summary portion of the email reported incorrect values.
In essence, the summary portion of the email did not equal the sum of the appropriate detail sections at the bottom of the email.

Attached is a ruby file that generates this email.

Debug this file and suggest changes that would resolve this bug. The issue is contained in the semantics of this individual file – you do not need the code of the class this class extends, info about the database, or info about the connection to that database.

2. This can be written in any language, the quality of your work is more important than the language you use.

Write a script that takes in a command line parameter and opens a browser to the Amazon search page for the parameter input.
