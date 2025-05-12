-- create database

CREATE DATABASE wk7a_NF_Assignment;
USE wk7a_NF_Assignment;

-- Q1. 1NF Normalization

-- Original Table that is unnormalized
CREATE TABLE ProductDetail (
  OrderID INT,
  CustomerName VARCHAR(100),
  Products VARCHAR(255)
);

INSERT INTO ProductDetail VALUES 
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

-- Normalized Table ProductDetail_1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);    

INSERT INTO ProductDetail_1NF VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- 1NF Result Output
SELECT * FROM ProductDetail_1NF;


-- Q2. Achieving 2NF (Second Normal Form)
-- Original Table OrderDetails-1NF

CREATE TABLE OrderDetails (
   OrderID INT,
   CustomerName VARCHAR(100),
   Product VARCHAR(100),
   Quantity INT
);   

INSERT INTO OrderDetails VALUES
(101, 'John Doe', 'Laptop', 2),
(101, 'John Doe', 'Mouse', 1),
(102, 'Jane Smith', 'Tablet', 3),
(102, 'Jane Smith', 'Keyboard', 1),
(102, 'Jane Smith', 'Mouse', 2),
(103, 'Emily Clark', 'Phone', 1);

-- Normalized Tables for 2NF
-- Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Orders VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- OrderItems Table
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderItems VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- For 2NF Result (Joined View):
SELECT 
    o.OrderID,
    o.CustomerName,
    oi.Product,
    oi.Quantity
FROM 
    Orders o
JOIN 
    OrderItems oi ON o.OrderID = oi.OrderID;


   
