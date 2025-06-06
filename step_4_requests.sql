/*
1. Get all dealerships
2. Find all vehicles for a specific dealership
3. Find a car by VIN
4. Find the dealership where a certain car is located, by VIN
5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)
6. Get all sales information for a specific dealer for a specific date range
*/
USE car_dealership;
-- 1 Get all dealerships
SELECT * FROM dealership;

-- 2 Find all vehicles for a specific dealership
SELECT * FROM vehicles v 
JOIN inventory i ON v.Vin = i.Vin
WHERE i.DealershipID = 1;

-- 3 Find a car by VIN
SELECT * FROM vehicles
WHERE Vin = "432134" OR Vin = "645331";

-- 4 Find the dealership where a certain car is located, by VIN
SELECT * FROM dealership d
JOIN inventory i ON d.DealershipID = i.DealershipID
WHERE i.Vin = "645331";

-- 5 Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)
SELECT * FROM dealership d
JOIN inventory i ON d.DealershipID = i.DealershipID
JOIN vehicles v ON i.Vin = v.Vin
WHERE VehicleMake = "Acura" AND VehicleModel = "RDX" AND Color = "Black";

-- 6 Get all sales information for a specific dealer for a specific date range
SELECT * FROM sales_contracts sc
JOIN inventory i ON sc.Vin = i.Vin
JOIN dealership d ON i.DealershipID = d.DealershipID
WHERE d.DealershipID = 2
AND sc.ContractDate BETWEEN '2025-06-01 13:30:09' AND '2025-06-06 13:30:09';