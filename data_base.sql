 CREATE DATABASE car_dealership; 
 USE car_dealership;
 
  CREATE TABLE vehicles(
  Vin VARCHAR(40) PRIMARY KEY UNIQUE,
  VehicleMake VARCHAR(70) ,
  VehicleModel VARCHAR(70) ,
  Color VARCHAR(40),
  VehicleYear INT ,
  Mileage INT DEFAULT 10,
  Price DECIMAL(10,2),
  is_sold BOOLEAN DEFAULT FALSE
  );
  
  INSERT INTO vehicles (Vin,VehicleMake,VehicleModel,Color,VehicleYear,Mileage,Price,is_sold) VALUES
  ("432134", "Acura", "RDX", "Black", 2022, "17000", 55000.50, FALSE),
  ("478032", "Toyota", "Prius", "Gray", 2012, "150000", 5200, FALSE),
  ("645331", "Honda", "CR-V", "Black", 2013, "152000", 5500, FALSE),
  ("873645", "Ford", "Escape", "White", 2015, 92000, 9800.00, FALSE),
  ("983212", "Chevrolet", "Malibu", "Blue", 2018, 68000, 13500.00, TRUE),
  ("128936", "BMW", "X3", "Silver", 2020, 42000, 29500.75, FALSE),
  ("563821", "Hyundai", "Elantra", "Red", 2016, 101000, 8900.50, FALSE),
  ("376492", "Nissan", "Altima", "Black", 2017, 88000, 11000.00, TRUE),
  ("492301", "Tesla", "Model 3", "White", 2021, 24000, 39999.99, FALSE),
  ("239184", "Jeep", "Wrangler", "Green", 2019, 36000, 32000.00, FALSE),
  ("812345", "Kia", "Soul", "Yellow", 2014, 134000, 6200.00, FALSE),
  ("756203", "Volkswagen", "Jetta", "Gray", 2013, 143000, 5100.00, TRUE),
  ("694821", "Subaru", "Outback", "Blue", 2018, 77000, 16800.00, FALSE);
  
  
CREATE TABLE dealership(
DealershipID INT PRIMARY KEY AUTO_INCREMENT,
CompanyName VARCHAR(100),
Address VARCHAR(100),
Phone VARCHAR(50)
);

INSERT INTO dealership (CompanyName, Address, Phone) VALUES
("Zerkle Car Emporium", "Random place", "7241234567"),
("Toyota Dealership", "11750 US-19, Wexford, PA 15090", "4125671209");

CREATE TABLE inventory(
DealershipID INT,
Vin VARCHAR(40),
PRIMARY KEY (DealershipID, Vin),
FOREIGN KEY (DealershipID) REFERENCES dealership(DealershipID),
FOREIGN KEY (Vin) REFERENCES vehicles(Vin)
);
INSERT INTO inventory (DealershipID, Vin) VALUES
  (1, "432134"),
  (1, "645331"),
  (1, "873645"),
  (1, "128936"),
  (1, "376492"),
  (1, "812345"),

  (2, "478032"),
  (2, "983212"),
  (2, "563821"),
  (2, "492301"),
  (2, "239184"),
  (2, "756203"),
  (2, "694821");


CREATE TABLE sales_contracts(
ContractID INT PRIMARY KEY AUTO_INCREMENT,
Vin VARCHAR(40),
CustomerName VARCHAR(100) NOT NULL,
CustomerPhone VARCHAR(20),
SalePrice DECIMAL(10,2),
FOREIGN KEY (Vin) REFERENCES vehicles(Vin)
);
INSERT INTO sales_contracts (Vin,CustomerName,CustomerPhone,SalePrice) VALUES
("983212", "John Smith", "5551234567", 13500.00),
("376492", "Emily Johnson", "5559876543", 11000.00),
("756203", "Carlos Martinez", "5554567890", 5100.00);
