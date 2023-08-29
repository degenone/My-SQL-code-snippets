USE northwind
SELECT * FROM Documentation
INSERT INTO Documentation VALUES ('nw/customer/', 'POST', 'Insert new customer to database', 123)
INSERT INTO Documentation VALUES ('nw/customer/{id}', 'PUT', 'Update customer information', 123)
INSERT INTO Documentation VALUES ('nw/customer/{id}', 'DELETE', 'Remove customer from database', 123)
--BEGIN TRANSACTION
--ROLLBACK
--COMMIT
UPDATE Documentation SET AvailableRoute = CONCAT('https://localhost:{port}/', AvailableRoute)