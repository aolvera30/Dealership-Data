DROP DATABASE IF EXISTS dealership;
-- Create a new database
CREATE DATABASE dealership;

-- Use the new database
USE dealership;

-- Table 1: dealerships
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);

-- Table 2: vehicles
CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    price DECIMAL(10, 2),
    sold BOOLEAN,
    type VARCHAR(50),
    mileage INT,
    color VARCHAR(50)
);

-- Table 3: inventory
CREATE TABLE inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Table 4: sales_contracts
CREATE TABLE sales_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    customer_name VARCHAR(50),
    sale_date DATE,
    sale_price DECIMAL(10, 2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Insert data into dealerships table
INSERT INTO dealerships (name, address, phone)
VALUES 
    ('City Motors', '123 Main St', '123-456-7890'),
    ('Highway Autos', '456 Elm St', '234-567-8901'),
    ('Luxury Rides', '789 Pine St', '345-678-9012'),
    ('Budget Cars', '101 Maple St', '456-789-0123');

-- Insert data into vehicles table
INSERT INTO vehicles (VIN, make, model, year, price, sold, type, mileage, color)
VALUES 
    ('1HGCM82633A004352', 'Toyota', 'Camry', 2020, 25000.00, FALSE, 'Sedan', 15000, 'Red'),
    ('1HGCM82633A004353', 'Honda', 'Accord', 2019, 23000.00, TRUE, 'Sedan', 20000, 'Blue'),
    ('1HGCM82633A004354', 'Ford', 'Fusion', 2018, 22000.00, FALSE, 'Sedan', 30000, 'White'),
    ('1HGCM82633A004355', 'Chevrolet', 'Malibu', 2021, 27000.00, TRUE, 'Sedan', 10000, 'Black'),
    ('1HGCM82633A004356', 'Nissan', 'Altima', 2020, 24000.00, FALSE, 'Sedan', 12000, 'Grey'),
    ('1HGCM82633A004357', 'BMW', '3 Series', 2021, 35000.00, TRUE, 'Sedan', 8000, 'Silver'),
    ('1HGCM82633A004358', 'Audi', 'A4', 2019, 33000.00, FALSE, 'Sedan', 25000, 'Green'),
    ('1HGCM82633A004359', 'Mercedes-Benz', 'C-Class', 2020, 40000.00, TRUE, 'Sedan', 5000, 'Blue');

-- Insert data into inventory table
INSERT INTO inventory (dealership_id, VIN)
VALUES 
    (1, '1HGCM82633A004352'),
    (2, '1HGCM82633A004353'),
    (1, '1HGCM82633A004354'),
    (2, '1HGCM82633A004355'),
    (3, '1HGCM82633A004356'),
    (3, '1HGCM82633A004357'),
    (4, '1HGCM82633A004358'),
    (4, '1HGCM82633A004359');

-- Insert data into sales_contracts table
INSERT INTO sales_contracts (VIN, customer_name, sale_date, sale_price)
VALUES 
    ('1HGCM82633A004353', 'John Doe', '2024-01-15', 22000.00),
    ('1HGCM82633A004355', 'Jane Smith', '2024-02-10', 26500.00),
    ('1HGCM82633A004357', 'Alice Johnson', '2024-03-05', 34000.00),
    ('1HGCM82633A004359', 'Robert Brown', '2024-04-20', 39000.00);

-- Select data from dealerships table
SELECT * FROM dealerships;

-- Select data from vehicles table
SELECT * FROM vehicles;

-- Select data from inventory table
SELECT * FROM inventory;

-- Select data from sales_contracts table
SELECT * FROM sales_contracts;
    
  