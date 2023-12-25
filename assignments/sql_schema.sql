-- Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    RegistrationDate DATE
);

-- Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL,
    ParentCategoryID INT,
    FOREIGN KEY (ParentCategoryID) REFERENCES Categories(CategoryID)
);

-- Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    UserID INT,
    OrderDate DATETIME NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- OrderItems table
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Addresses table
CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY,
    UserID INT,
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    ZipCode VARCHAR(10) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Reviews table
CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    UserID INT,
    Rating INT NOT NULL,
    Comment TEXT,
    ReviewDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Coupons table
CREATE TABLE Coupons (
    CouponID INT PRIMARY KEY,
    CouponCode VARCHAR(20) UNIQUE NOT NULL,
    DiscountAmount DECIMAL(5, 2) NOT NULL,
    ExpiryDate DATE NOT NULL
);

-- CartItems table
CREATE TABLE CartItems (
    CartItemID INT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATETIME NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into Users table
INSERT INTO Users (UserID, UserName, Email, PasswordHash, RegistrationDate)
VALUES
(1, 'JohnDoe', 'john.doe@email.com', 'hashed_password_1', '2023-01-01'),
(2, 'JaneSmith', 'jane.smith@email.com', 'hashed_password_2', '2023-02-15'),
(3, 'AliceJones', 'alice.jones@email.com', 'hashed_password_3', '2023-03-20'),
(4, 'BobJohnson', 'bob.johnson@email.com', 'hashed_password_4', '2023-04-05'),
(5, 'EvaMiller', 'eva.miller@email.com', 'hashed_password_5', '2023-05-10'),
(6, 'ChrisBrown', 'chris.brown@email.com', 'hashed_password_6', '2023-06-15'),
(7, 'OliviaDavis', 'olivia.davis@email.com', 'hashed_password_7', '2023-07-20'),
(8, 'DanielWhite', 'daniel.white@email.com', 'hashed_password_8', '2023-08-25'),
(9, 'SophiaTaylor', 'sophia.taylor@email.com', 'hashed_password_9', '2023-09-30'),
(10, 'MichaelLee', 'michael.lee@email.com', 'hashed_password_10', '2023-10-05');

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Description, Price, StockQuantity, CategoryID)
VALUES
(1, 'Laptop', 'Powerful laptop with high-performance features', 899.99, 50, 1),
(2, 'Smartphone', 'Latest smartphone with advanced features', 599.99, 100, 2),
(3, 'Tablet', 'Lightweight tablet for on-the-go use', 349.99, 30, 2),
(4, 'Desktop PC', 'High-end desktop computer for gaming', 1499.99, 20, 1),
(5, 'Wireless Mouse', 'Ergonomic wireless mouse with customizable buttons', 49.99, 200, 3),
(6, 'Bluetooth Headphones', 'Over-ear headphones with noise-canceling feature', 129.99, 80, 4),
(7, 'Smart Watch', 'Fitness tracker with heart rate monitoring', 79.99, 120, 5),
(8, '4K TV', 'Ultra HD television with smart features', 799.99, 15, 6),
(9, 'Digital Camera', 'Mirrorless digital camera with 24MP sensor', 899.99, 25, 7),
(10, 'External Hard Drive', '1TB portable external hard drive', 69.99, 50, 8);

-- Insert data into Categories table
INSERT INTO Categories (CategoryID, CategoryName, ParentCategoryID)
VALUES
(1, 'Electronics', NULL),
(2, 'Mobile Devices', 1),
(3, 'Computer Accessories', 1),
(4, 'Audio', 1),
(5, 'Wearables', 1),
(6, 'TV & Home Entertainment', 1),
(7, 'Cameras', 1),
(8, 'Storage', 1),
(9, 'Office Supplies', NULL),
(10, 'Furniture', NULL);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, UserID, OrderDate, TotalAmount, OrderStatus)
VALUES
(1, 1, '2023-03-01 10:30:00', 899.99, 'Completed'),
(2, 2, '2023-03-02 12:45:00', 599.99, 'Pending'),
(3, 3, '2023-03-03 14:00:00', 349.99, 'Shipped'),
(4, 4, '2023-03-04 15:30:00', 1499.99, 'Processing'),
(5, 5, '2023-03-05 17:00:00', 49.99, 'Completed'),
(6, 6, '2023-03-06 18:15:00', 129.99, 'Pending'),
(7, 7, '2023-03-07 20:00:00', 79.99, 'Shipped'),
(8, 8, '2023-03-08 21:30:00', 799.99, 'Processing'),
(9, 9, '2023-03-09 23:00:00', 899.99, 'Completed'),
(10, 10, '2023-03-10 09:30:00', 69.99, 'Pending');

-- Insert data into OrderItems table
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1, 1, 1, 1, 899.99),
(2, 2, 2, 2, 599.99),
(3, 3, 3, 1, 349.99),
(4, 4, 4, 1, 1499.99),
(5, 5, 5, 3, 49.99),
(6, 6, 6, 1, 129.99),
(7, 7, 7, 2, 79.99),
(8, 8, 8, 1, 799.99),
(9, 9, 9, 1, 899.99),
(10, 10, 10, 2, 69.99);

-- Insert data into Addresses table
INSERT INTO Addresses (AddressID, UserID, Street, City, ZipCode, Country)
VALUES
(1, 1, '123 Main St', 'Cityville', '12345', 'USA'),
(2, 2, '456 Oak Ave', 'Townsville', '67890', 'USA'),
(3, 3, '789 Pine St', 'Villagetown', '54321', 'USA'),
(4, 4, '101 Maple Ave', 'Hamletville', '98765', 'USA'),
(5, 5, '202 Cedar St', 'Ruraltown', '13579', 'USA'),
(6, 6, '303 Birch Ave', 'Suburbia', '24680', 'USA'),
(7, 7, '404 Elm St', 'Metro City', '97531', 'USA'),
(8, 8, '505 Oak Ave', 'Urbanville', '86420', 'USA'),
(9, 9, '606 Pine St', 'Downtown', '75309', 'USA'),
(10, 10, '707 Maple Ave', 'City Center', '64218', 'USA');

-- Insert data into Reviews table
INSERT INTO Reviews (ReviewID, ProductID, UserID, Rating, Comment, ReviewDate)
VALUES
(1, 1, 1, 5, 'Excellent product!', '2023-03-05'),
(2, 2, 2, 4, 'Great features but a bit expensive', '2023-03-10'),
(3, 3, 3, 4, 'Good value for the money', '2023-03-15'),
(4, 4, 4, 5, 'Amazing gaming PC, runs smoothly', '2023-03-20'),
(5, 5, 5, 3, 'Average mouse, but gets the job done', '2023-03-25'),
(6, 6, 6, 4, 'Excellent sound quality, comfortable to wear', '2023-03-30'),
(7, 7, 7, 4, 'Helps me keep track of my health goals', '2023-04-05'),
(8, 8, 8, 5, 'Stunning picture quality, love it!', '2023-04-10'),
(9, 9, 9, 4, 'Great camera for photography enthusiasts', '2023-04-15'),
(10, 10, 10, 3, 'Decent external hard drive for backups', '2023-04-20');

-- Insert data into Coupons table
INSERT INTO Coupons (CouponID, CouponCode, DiscountAmount, ExpiryDate)
VALUES
(1, 'SAVE10', 10.00, '2023-04-01'),
(2, 'FREESHIP', 0.00, '2023-03-15'),
(3, 'BIGSALE', 15.00, '2023-04-30'),
(4, 'LOYALTY15', 15.00, '2023-05-15'),
(5, 'NEWUSER20', 20.00, '2023-05-31'),
(6, 'SUMMER25', 25.00, '2023-06-30'),
(7, 'BACKTOSCHOOL', 10.00, '2023-09-01'),
(8, 'HOLIDAY20', 20.00, '2023-12-01'),
(9, 'WINTER25', 25.00, '2024-01-01'),
(10, 'SPRINGSALE', 15.00, '2024-03-01');

-- Insert data into CartItems table
INSERT INTO CartItems (CartItemID, UserID, ProductID, Quantity)
VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 2),
(5, 5, 5, 3),
(6, 6, 6, 1),
(7, 7, 7, 2),
(8, 8, 8, 1),
(9, 9, 9, 1),
(10, 10, 10, 2);

-- Insert data into Payments table
INSERT INTO Payments (PaymentID, OrderID, PaymentDate, Amount, PaymentMethod)
VALUES
(1, 1, '2023-03-05 15:30:00', 899.99, 'Credit Card'),
(2, 2, '2023-03-08 09:00:00', 599.99, 'PayPal'),
(3, 3, '2023-03-10 12:30:00', 349.99, 'Credit Card'),
(4, 4, '2023-03-12 14:45:00', 1499.99, 'Bank Transfer'),
(5, 5, '2023-03-15 16:00:00', 49.99, 'PayPal'),
(6, 6, '2023-03-18 18:15:00', 129.99, 'Credit Card'),
(7, 7, '2023-03-20 20:30:00', 79.99, 'Bank Transfer'),
(8, 8, '2023-03-23 22:45:00', 799.99, 'Credit Card'),
(9, 9, '2023-03-26 01:00:00', 899.99, 'PayPal'),
(10, 10, '2023-03-28 03:15:00', 69.99, 'Credit Card');
