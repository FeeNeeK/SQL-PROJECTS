-- Creates a database named ShopDataBase

CREATE DATABASE ShopDataBase;
USE ShopDataBase;

-- Creates a table named Users
-- Defines a table with columns for ID, name, email, phone number, and creation timestamp.

CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creates a table named Categories
-- Defines a table with columns for ID and name.

CREATE TABLE Categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

--  Creates a table named Products
-- Defines a table with columns for ID, name, price, stock, and category ID, referencing the Categories table.

CREATE TABLE Products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

-- Creates a table named Orders
-- Defines a table with columns for ID, user ID, order date, and status, referencing the Users table.

CREATE TABLE Orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'shipped', 'delivered', 'canceled', 'processing') DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Creates a table named Order_Items
-- Defines a table with columns for ID, order ID, product ID, quantity, and price, referencing the Orders and Products tables.

CREATE TABLE Order_Items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- Creates a table named Addresses
-- Defines a table with columns for ID, user ID, street, city, postal code, and country, referencing the Users table.

CREATE TABLE Addresses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Inserts data

-- Inserts data into the Categories table
-- Adds predefined category names such as Electronics, Clothing, and others.

INSERT INTO
Categories 
(name) VALUES 
    ('Electronics'), 
    ('Clothing'), 
    ('Home & Garden'), 
    ('Sports & Outdoors'), 
    ('Health & Beauty'), 
    ('Toys & Games'), 
    ('Automotive'), 
    ('Books & Media'), 
    ('Jewelry & Accessories'), 
    ('Food & Beverages'), 
    ('Office Supplies'), 
    ('Pet Supplies'), 
    ('Baby & Kids');
    
-- Inserts data into the Users table
-- Adds users with their names, emails, and optionally phone numbers.

INSERT INTO
Users
(name, email, phone_number) 
VALUES 
    ('Krzysztof Wiśniewski', 'krzysztof.wisniewski@example.com', '690 214 875'),
    ('Magdalena Dąbrowska', 'magdalena.dabrowska@example.com', NULL),
    ('Tomasz Wójcik', 'tomasz.wojcik@example.com', '731 456 908'),
    ('Aleksandra Kamińska', 'aleksandra.kaminska@example.com', '601 852 369'),
    ('Paweł Jabłoński', 'pawel.jablonski@example.com', '785 456 213'),
    ('Karolina Nowicka', 'karolina.nowicka@example.com', NULL),
    ('Michał Kowalczyk', 'michal.kowalczyk@example.com', '512 963 874'),
    ('Natalia Wojciechowska', 'natalia.wojciechowska@example.com', '698 741 236'),
    ('Adrian Zieliński', 'adrian.zielinski@example.com', '500 123 987'),
    ('Ewa Szymańska', 'ewa.szymanska@example.com', NULL),
    ('Grzegorz Woźniak', 'grzegorz.wozniak@example.com', '699 845 123'),
    ('Patrycja Król', 'patrycja.krol@example.com', '721 985 632'),
    ('Łukasz Pawlak', 'lukasz.pawlak@example.com', '600 741 258'),
    ('Sylwia Kaczmarek', 'sylwia.kaczmarek@example.com', NULL),
    ('Mateusz Czarnecki', 'mateusz.czarnecki@example.com', '695 235 784'),
    ('Joanna Piotrowska', 'joanna.piotrowska@example.com', '737 456 908'),
    ('Dawid Michalski', 'dawid.michalski@example.com', '501 742 369'),
    ('Katarzyna Adamczyk', 'katarzyna.adamczyk@example.com', NULL),
    ('Maciej Jankowski', 'maciej.jankowski@example.com', '612 875 963'),
    ('Borys Cieślak', 'borys.cieslak@example.com', '601 234 567'),  
	('Lena Wróblewska', 'lena.wroblewska@example.com', '732 918 455'),  
	('Igor Majewski', 'igor.majewski@example.com', NULL),  
	('Malwina Szczepańska', 'malwina.szczepanska@example.com', NULL),  
	('Konrad Bartkowiak', 'konrad.bartkowiak@example.com', '725 667 981')
    ;
    
-- Inserts data into the Addresses table
-- Adds addresses for specific users with street, city, postal code, and country details.

INSERT INTO 
Addresses (user_id, street, city, postal_code, country) 
VALUES 
    (1, 'ul. Kwiatowa 10', 'Warszawa', '00-001', 'Polska'),
    (2, 'ul. Dębowa 5', 'Kraków', '30-002', 'Polska'),
    (3, 'ul. Sosnowa 8', 'Gdańsk', '80-003', 'Polska'),
    (4, 'ul. Brzozowa 12', 'Wrocław', '50-004', 'Polska'),
    (5, 'ul. Świerkowa 7', 'Poznań', '60-005', 'Polska'),
    (6, 'ul. Akacjowa 3', 'Łódź', '90-006', 'Polska'),
    (7, 'ul. Klonowa 15', 'Szczecin', '70-007', 'Polska'),
    (8, 'ul. Lipowa 9', 'Katowice', '40-008', 'Polska'),
    (9, 'ul. Jesionowa 20', 'Bydgoszcz', '85-009', 'Polska'),
    (10, 'ul. Wierzbowa 11', 'Lublin', '20-010', 'Polska'),
    (11, 'ul. Grabowa 6', 'Białystok', '15-011', 'Polska'),
    (12, 'ul. Modrzewiowa 14', 'Gdynia', '81-012', 'Polska'),
    (13, 'ul. Kasztanowa 4', 'Radom', '26-013', 'Polska'),
    (14, 'ul. Jaworowa 13', 'Lubin', '87-014', 'Polska'),
    (15, 'ul. Bukowa 8', 'Opole', '45-015', 'Polska'),
    (16, 'ul. Dąbrowa 10', 'Częstochowa', '42-016', 'Polska'),
    (17, 'ul. Magnoliowa 22', 'Kielce', '25-017', 'Polska'),
    (18, 'ul. Orzechowa 7', 'Rzeszów', '35-018', 'Polska'),
    (19, 'ul. Platanowa 19', 'Gliwice', '44-019', 'Polska'),
    (20, 'ul. Cedrowa 5', 'Katowice', '10-020', 'Polska')
    ;

-- Inserts data into the Products table
-- Adds products with names, prices, stock quantities, and category IDs.

INSERT INTO 
Products 
(name, price, stock, category_id) 
VALUES 
    ('Smartphone', 2999.99, 15, 1),
    ('Laptop', 4999.99, 10, 1),
    ('Winter Jacket', 399.99, 20, 2),
    ('Kitchen Mixer', 199.99, 25, 3),
    ('Wireless Headphones', 499.99, 30, 1),
    ('Smartwatch', 899.99, 12, 1),
    ('Gaming Mouse', 249.99, 40, 1),
    ('Bluetooth Speaker', 349.99, 22, 1),
    ('LED TV 55"', 3299.99, 8, 1),
    ('External Hard Drive 1TB', 399.99, 18, 1),
    ('T-Shirt', 59.99, 50, 2),
    ('Sneakers', 299.99, 35, 2),
    ('Backpack', 149.99, 28, 2),
    ('Jeans', 199.99, 40, 2),
    ('Electric Toothbrush', 249.99, 15, 5),
    ('Hair Dryer', 179.99, 20, 5),
    ('Running Shoes', 349.99, 30, 4),
    ('Dumbbell Set', 499.99, 10, 4),
    ('Yoga Mat', 99.99, 50, 4),
    ('Camping Tent', 699.99, 7, 4),
    ('Wristwatch', 799.99, 12, 9),
    ('Gold Necklace', 1299.99, 5, 9),
    ('Earrings', 499.99, 20, 9),
    ('Coffee Machine', 799.99, 15, 3),
    ('Vacuum Cleaner', 1199.99, 10, 3),
    ('Bookshelf', 599.99, 8, 8),
    ('Office Chair', 899.99, 12, 8),
    ('Board Game', 149.99, 25, 6),
    ('RC Car', 349.99, 15, 6),
    ('Dog Food 10kg', 249.99, 20, 12),
    ('Baby Stroller', 1299.99, 8, 13);

-- Modifies the Orders table
-- Updates the status column to use an ENUM with values 'pending', 'shipped', 'delivered', 'canceled', 'processing', defaulting to 'pending'.

ALTER TABLE Orders
MODIFY COLUMN status ENUM('pending', 'shipped', 'delivered', 'canceled', 'processing') DEFAULT 'pending';

-- Inserts data into the Orders table
-- Adds orders with user IDs, order dates, and statuses.

INSERT INTO Orders (user_id, order_date, status) VALUES 
    (3, '2024-02-01 12:00:00', 'shipped'),
    (7, '2024-02-02 15:30:00', 'pending'),
    (1, '2024-02-03 09:15:00', 'delivered'),
    (12, '2024-02-04 18:45:00', 'shipped'),
    (5, '2024-02-05 14:20:00', 'processing'),
    (9, '2024-02-06 10:10:00', 'canceled'),
    (4, '2024-02-07 16:55:00', 'pending'),
    (8, '2024-02-08 08:30:00', 'delivered'),
    (6, '2024-02-09 13:40:00', 'shipped'),
    (2, '2024-02-10 11:25:00', 'processing'),
    (19, '2024-02-11 17:05:00', 'pending'),
    (17, '2024-02-12 09:50:00', 'shipped'),
    (15, '2024-02-13 20:15:00', 'delivered'),
    (13, '2024-02-14 07:45:00', 'canceled'),
    (16, '2024-02-15 15:10:00', 'processing'),
    (10, '2024-02-16 12:30:00', 'shipped'),
    (18, '2024-02-17 19:20:00', 'pending'),
    (10, '2024-02-18 10:55:00', 'delivered'),
    (14, '2024-02-19 14:40:00', 'processing'),
    (3, '2024-02-20 08:05:00', 'canceled'),
    (5, '2024-02-21 16:15:00', 'pending'),
    (8, '2024-02-22 13:25:00', 'shipped'),
    (12, '2024-02-23 11:00:00', 'delivered'),
    (7, '2024-02-24 18:30:00', 'processing'),
    (6, '2024-02-25 07:10:00', 'shipped'),
    (13, '2024-02-26 15:45:00', 'canceled'),
    (9, '2024-02-27 12:50:00', 'delivered'),
    (1, '2024-02-28 09:35:00', 'pending'),
    (17, '2024-02-29 14:55:00', 'processing'),
    (14, '2024-03-01 10:25:00', 'shipped'),
    (12, '2024-03-02 17:40:00', 'delivered'),
    (18, '2024-03-03 08:15:00', 'canceled'),
    (2, '2024-03-04 13:05:00', 'pending');

-- Inserts data into the Order_Items table
-- Adds order items with order IDs, product IDs, quantities, and prices.

INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES 
    (1, 7, 2, 2999.99),
    (1, 5, 3, 399.99),
    (2, 3, 1, 4999.99),
    (3, 9, 4, 199.99),
    (4, 2, 1, 499.99),
    (4, 1, 2, 899.99),
    (5, 6, 3, 249.99),
    (6, 4, 1, 349.99),
    (7, 10, 2, 2999.99),
    (8, 7, 5, 3299.99),
    (9, 8, 3, 4999.99),
    (10, 9, 1, 399.99),
    (11, 6, 2, 59.99),
    (12, 2, 1, 299.99),
    (13, 3, 4, 149.99),
    (14, 1, 2, 199.99),
    (15, 4, 1, 249.99),
    (16, 9, 5, 179.99),
    (17, 5, 3, 349.99),
    (18, 7, 2, 499.99),
    (19, 6, 1, 99.99),
    (20, 3, 3, 699.99),
    (21, 8, 1, 2999.99),
    (22, 4, 2, 799.99),
    (23, 5, 4, 1299.99),
    (24, 6, 1, 499.99),
    (25, 2, 3, 799.99),
    (26, 3, 2, 1199.99),
    (27, 8, 1, 599.99),
    (28, 10, 4, 899.99),
    (29, 9, 5, 149.99),
    (30, 7, 2, 349.99),
    (31, 1, 1, 249.99),
    (32, 6, 3, 1299.99);
    
    
-- SQL Queries:

-- 1. Retrieves all users.
SELECT * FROM Users;

-- 2. Retrieves all products with their categories
SELECT Products.name, Categories.name AS category
FROM Products
JOIN Categories ON Products.category_id = Categories.id;

-- 3. Retrieves all orders with user names ordered by order date;
SELECT Orders.id, Users.name, Orders.status, Orders.order_date
FROM Orders
JOIN Users ON Orders.user_id = Users.id
order by order_date asc;

-- 4. Retrieves the number of orders per user
SELECT Users.name, COUNT(Orders.id) AS total_orders
FROM Users
LEFT JOIN Orders ON Users.id = Orders.user_id
GROUP BY Users.name;

-- 5. Retrieves the total spending per user
SELECT Users.name, SUM(Order_Items.price * Order_Items.quantity) AS total_spent
FROM Users
JOIN Orders ON Users.id = Orders.user_id
JOIN Order_Items ON Orders.id = Order_Items.order_id
GROUP BY Users.name;

-- 6. Retrieves the average product price per category
SELECT Categories.name, AVG(Products.price) AS avg_price
FROM Products
JOIN Categories ON Products.category_id = Categories.id
GROUP BY Categories.name;

-- 7. Retrieves users who haven’t placed any orders
SELECT Users.name FROM Users
LEFT JOIN Orders ON Users.id = Orders.user_id
WHERE Orders.id IS NULL;

-- 8. Retrieves order details with products
SELECT Orders.id, Users.name, Products.name, Order_Items.quantity, Order_Items.price
FROM Orders
JOIN Users ON Orders.user_id = Users.id
JOIN Order_Items ON Orders.id = Order_Items.order_id
JOIN Products ON Order_Items.product_id = Products.id;

-- 9. Retrieves the most frequently ordered products
SELECT Products.name, COUNT(Order_Items.product_id) AS times_ordered
FROM Order_Items
JOIN Products ON Order_Items.product_id = Products.id
GROUP BY Products.name
ORDER BY times_ordered DESC
LIMIT 7;

-- 10. Retrieves users and their addresses
SELECT Users.name, Addresses.street, Addresses.city, Addresses.postal_code, Addresses.country
FROM Users
JOIN Addresses ON Users.id = Addresses.user_id;

-- 11. Retrieves all orders with user addresses
SELECT Orders.id, Users.name, Addresses.* 
FROM Orders
JOIN Users ON Orders.user_id = Users.id
JOIN Addresses ON Users.id = Addresses.user_id;

-- 12. Retrieves the total value of all orders
SELECT SUM(Order_Items.price * Order_Items.quantity) AS total_revenue FROM Order_Items;

-- 13. Retrieves products with stock below 10
SELECT * FROM Products WHERE stock < 10;

-- 14. Retrieves orders with more than one product
SELECT Orders.id, COUNT(Order_Items.id) AS item_count
FROM Orders
JOIN Order_Items ON Orders.id = Order_Items.order_id
GROUP BY Orders.id
HAVING item_count > 1;

-- 15. Retrieves products that haven’t been ordered
SELECT Products.name FROM Products
LEFT JOIN Order_Items ON Products.id = Order_Items.product_id
WHERE Order_Items.id IS NULL;

-- 16. Retrieves users and their order counts
SELECT Users.name, COUNT(Orders.id) AS order_count
FROM Users
LEFT JOIN Orders ON Users.id = Orders.user_id
GROUP BY Users.name;

-- 17. Retrieves the most expensive order
SELECT Orders.id, Users.name, SUM(Order_Items.price * Order_Items.quantity) AS total_value
FROM Orders
JOIN Users ON Orders.user_id = Users.id
JOIN Order_Items ON Orders.id = Order_Items.order_id
GROUP BY Orders.id, Users.name
ORDER BY total_value DESC
LIMIT 1;

-- 18. Retrieves products and how often they were ordered
SELECT Products.name, COUNT(Order_Items.order_id) AS times_ordered
FROM Products
JOIN Order_Items ON Products.id = Order_Items.product_id
GROUP BY Products.name
order by times_ordered desc
limit 10;

-- 19. Retrieves users with more than one order
SELECT Users.name, COUNT(Orders.id) AS order_count
FROM Users
JOIN Orders ON Users.id = Orders.user_id
GROUP BY Users.name
HAVING order_count > 1;

-- 20. Retrieves cities with the most users
SELECT Addresses.city, COUNT(Users.id) AS user_count
FROM Addresses
JOIN Users ON Addresses.user_id = Users.id
GROUP BY Addresses.city
ORDER BY user_count DESC;
