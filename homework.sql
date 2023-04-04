CREATE TABLE customers
(
  customer_id int IDENTITY(1,1), 
  customer_name varchar(50)
)

INSERT INTO customers VALUES
  ('George Washington'),
  ('John Adams'), 
  ('Thomas Jefferson'), 
  ('James Madison'), 
  ('James Monroe'),
  ('John Quincy Adams'), 
  ('Andrew Jackson'), 
  ('Martin Van Buren'), 
  ('William Henry Harrison'), 
  ('John Tyler'),
  ('James K Polk'), 
  ('Zachary Taylor'), 
  ('Millard Filmore'), 
  ('Franklin Pierce'), 
  ('James Buchanan'), 
  ('Abraham Lincoln'),
  ('Andrew Johnson'), 
  ('Ulysses S. Grant'), 
  ('Rutherford B. Hayes'),
  ('James A. Garfield'), 
  ('Chester A. Arthur'), 
  ('Grover Cleveland'), 
  ('Benjamin Harrison'), 
  ('William McKinley'), 
  ('Theodore Roosevelt'), 
  ('William Howard Taft'), 
  ('Woodrow Wilson'), 
  ('Warren G. Harding'), 
  ('Calvin Coolidge'), 
  ('Herbert Hoover'), 
  ('Franklin D. Roosevelt'), 
  ('Harry S. Truman'), 
  ('Dwight D. Eisenhower'), 
  ('John F. Kennedy'), 
  ('Lyndon B. Johnson'), 
  ('Richard Nixon'), 
  ('Gerald Ford'), 
  ('Jimmy Carter'), 
  ('Ronald Reagan'), 
  ('George H. W. Bush'), 
  ('Bill Clinton'), 
  ('George W. Bush'), 
  ('Barack Obama')
  
  
 CREATE TABLE products
 (
   product_id int IDENTITY(1, 1),
   product_name varchar(100), 
   price money, 
   amount_available int,
   out_of_stock bit
 )
 
 INSERT INTO products VALUES
 ('beach ball', 4.00, 30, 0),
 ('beach chair', 15.00, 40, 1), 
 ('ice chest', 9.00, 55, 0), 
 ('raft', 7.50, 0, 1),
 ('sun tan lotion', 3.50, 25, 1),
 ('towel', 12.00, 7, 1),
 ('beach umbrella', 45.00, 5, 0),
 ('frisbee', 2.50, 2, 0),
 ('football', 14.00, 4, 0),
 ('fishing net', 6.25, 1, 0),
 ('beach hat', 15.00, 4, 0)
 

 CREATE TABLE classes
 (
    class_id int IDENTITY(1,1),
    class_name nvarchar(50), 
    price money,
    instructor_id int,
    start_time datetime, 
    end_time datetime
  )

 INSERT INTO classes VALUES
 ('boating lessongs', 125.00, 1, '2015-05-02 10:00:00:000', '2015-05-02 12:00:00:000'), 
 ('scuba diving', 100.00, 2, '2015-05-02 13:00:00:000', '2015-05-02 15:00:00:000'),
 ('kayaking', 30.00, 3, '2015-05-02 12:00:00:000', '2015-05-02 14:00:00:000'),
 ('volleyball tournament', 0.00, 4, '2015-05-02 14:00:00:000', '2015-05-02 17:00:00:000'),
 ('jetski class', 65.00, 5, '2015-05-02 14:00:00:000', '2015-05-02 16:00:00:000'), 
 ('deep sea fishing', 200.00, 6, '2015-05-02 08:00:00:000', '2015-05-02 12:00:00:000'),
 ('beach cooking dinner', 35.00, 7, '2015-05-02 17:00:00:000', '2015-05-02 19:00:00:000'),
 ('surfing lessons', 35.00, 1, '2015-05-02 07:00:00:000', '2015-05-02 09:00:00:000'),
 ('shelling', 10.00, 3, '2015-05-02 19:00:00:000', '2015-05-02 20:00:00:000')

 
 CREATE TABLE instructors
 (
   instructor_id int IDENTITY(1,1),
   instructor_name varchar(50)
 )
 
 INSERT INTO instructors VALUES
 ('Hulk Hogan'),
 ('Bill Goldberg'),
 ('Dwayne Johnson'), 
 ('Big Show'), 
 ('Brock Lesner'), 
 ('Triple H'),
 ('Chris Jericho')
 
 CREATE TABLE registrations
 (
   registration_id int IDENTITY(1,1),
   paid bit,
   registered_online bit
 )
 
 INSERT INTO registrations VALUES
 (0, 1),
 (1, 1),
 (1, 1),
 (0, 1),
 (0, 1),
 (1, 0),
 (0, 1),
 (1, 1),
 (1, 1),
 (0, 1),
 (0, 1),
 (1, 0)
 
 
 CREATE TABLE transactions
 (
   id int IDENTITY(1,1),
   customer_id int, 
   product_id int,
   class_id int,
   registration_id int,
   transaction_time datetime
 )

INSERT INTO transactions VALUES
(1, 2, null, null,'2015-05-01 10:09:00.000'),
(1, 3, null, null, '2015-05-01 10:09:00.000'),
(1, 5, null, null, '2015-05-01 10:09:00.000'),
(1, 7, null, null, '2015-05-01 10:09:05.000'),
(3, 1, null, null, '2015-05-01 10:09:05.000'),
(3, 1, null, null, '2015-05-01 10:09:05.000'),
(3, 4, null, null, '2015-05-01 10:09:05.000'),
(3, 5, null, null, '2015-05-01 10:09:05.000'),
(3, 7, null, null, '2015-05-01 10:09:05.000'),
(7, 11, null, null, '2015-05-01 11:10:00.000'),
(7, 10, null, null,'2015-05-01 11:10:00.000'),
(7, 8, null, null, '2015-05-01 11:10:00.000'),
(9, 10, null, null, '2015-05-01 11:10:07.000'),
(9, 8, null, null, '2015-05-01 11:10:07.000'),
(9, 4, null, null, '2015-05-01 11:10:07.000'),
(12, 2, null, null, '2015-05-01 11:11:05.000'),
(12, 10, null, null, '2015-05-01 11:11:05.000'),
(12, 7, null, null, '2015-05-01 11:11:05.000'),
(12, 4, null, null, '2015-05-01 11:11:05.000'),
(40, null, 1, 1, '2015-05-01 11:11:05.000'),
(38, null, 2, 2, '2015-05-01 12:00:00.000'),
(35, null, 2, 3, '2015-05-01 13:10:49.000'),
(32, null, 9, 4, '2015-05-01 14:11:05.000'),
(31, null, 2, 5, '2015-05-01 11:11:05.000'),
(30, null, 3, 6, '2015-05-01 12:00:00.000'),
(25, null, 4, 7, '2015-05-01 13:10:49.000'),
(26, null, 5, 8, '2015-05-01 14:11:05.000'),
(41, null, 5, 9, '2015-05-01 11:11:05.000'),
(28, null, 5, 10, '2015-05-01 12:00:00.000'),
(29, null, 6, 11, '2015-05-01 13:10:49.000'),
(42, null, 10, 12, '2015-05-01 14:11:05.000')
