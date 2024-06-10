DROP DATABASE IF EXISTS Dealership;
CREATE DATABASE Dealership;
USE Dealership;

-- Dealership table
CREATE TABLE dealership
(
	dealership_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12),
    PRIMARY KEY (dealership_id)
);

INSERT INTO dealership ( dealership_id ,name,address,phone)
VALUES ( 123,'Budget Cars', '2047 Holly ST. Hayward,Ca 94545','510-225-5777')
      ,('Premium Autos', '1234 Elm St. San Jose, CA 95112', '408-555-1234')
      ,('Luxury Rides', '7890 Maple Ave. Fremont, CA 94536', '510-987-6543');
ALTER TABLE dealership AUTO_INCREMENT 100;

-- Vehicle Table
CREATE TABLE vehicles
(
	vin VARCHAR(50) PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    odometer INT,
    in_stock BOOLEAN
);
INSERT INTO vehicles (vin, make, model, year, odometer, in_stock)
VALUES
('12345', 'Honda', 'Accord', 2020, 15000, TRUE),
('23456', 'Nissan', 'Altima', 2019, 30000, TRUE),
('34567', 'Chevrolet', 'Silverado', 2021, 5000, FALSE);

-- Inventory table
CREATE TABLE inventory
(
    dealership_id INT,
    vin VARCHAR(50),
    PRIMARY KEY (dealership_id, vin),
     FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

-- Insert initial data into inventory
INSERT INTO inventory (dealership_id, vin)
VALUES
(100, '12345'),
(101, '23456'),
(102, '34567');

-- Add foreign keys
ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_dealership
FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id);

ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_vehicle
FOREIGN KEY (vin) REFERENCES vehicles(vin);













    
      






