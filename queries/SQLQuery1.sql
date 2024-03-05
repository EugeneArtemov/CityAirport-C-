use CityAirport;
CREATE TABLE Airlines (
airline_id INT IDENTITY PRIMARY KEY,
airline_name VARCHAR(255),
airline_address VARCHAR(255),
airline_phone VARCHAR(20)
);
CREATE TABLE Airplanes (
airplane_id INT IDENTITY PRIMARY KEY,
airplane_name VARCHAR(255),
airplane_capacity INT,
airline_id INT,
FOREIGN KEY (airline_id) REFERENCES Airlines (airline_id)
);

CREATE TABLE Flights (
flight_id INT IDENTITY PRIMARY KEY,
flight_date DATETIME,
flight_duration TIME,
flight_origin VARCHAR(255),
flight_destination VARCHAR(255),
flight_price FLOAT,
airplane_id INT,
FOREIGN KEY (airplane_id) REFERENCES Airplanes (airplane_id)
);

CREATE TABLE Passengers (
passenger_id INT IDENTITY PRIMARY KEY,
passenger_firstname VARCHAR(255),
passenger_lastname VARCHAR(255),
passenger_address VARCHAR(255),
passenger_phone VARCHAR(20)
);

CREATE TABLE Seats (
seat_id INT IDENTITY PRIMARY KEY,
seat_number VARCHAR(20),
seat_class VARCHAR(20),
airplane_id INT,
FOREIGN KEY (airplane_id) REFERENCES Airplanes (airplane_id)
);
CREATE TABLE Reservations (
reservation_id INT IDENTITY PRIMARY KEY,
reservation_date DATETIME,
flight_id INT,
passenger_id INT,
seat_id INT,
FOREIGN KEY (flight_id) REFERENCES Flights (flight_id),
FOREIGN KEY (passenger_id) REFERENCES Passengers (passenger_id),
FOREIGN KEY (seat_id) REFERENCES Seats (seat_id)
);

INSERT INTO Airlines (airline_name, airline_address, airline_phone)
VALUES 
  ('Delta Airlines', 'Atlanta, GA', '800-221-1212'),
  ('American Airlines', 'Fort Worth, TX', '800-433-7300'),
  ('United Airlines', 'Chicago, IL', '800-864-8331'),
  ('Southwest Airlines', 'Dallas, TX', '800-I-FLY-SWA'),
  ('Jet Blue', 'Long Island City, NY', '1-800-JETBLUE'),
  ('Alaska Airlines', 'Seattle, WA', '800-252-7522');

INSERT INTO Airplanes (airplane_name, airplane_capacity, airline_id)
VALUES 
  ('Boeing 737', 189, 1),
  ('Airbus A320', 160, 2),
  ('Boeing 767', 270, 3),
  ('Boeing 737 MAX', 220, 1),
  ('Airbus A321neo', 206, 5),
  ('Embraer E175', 76, 6);

INSERT INTO Flights (flight_date, flight_duration, flight_origin, flight_destination, flight_price, airplane_id)
VALUES 
  ('2023-09-01', '4:0:0', 'New York', 'Los Angeles', 450.00, 1),
  ('2023-09-03', '3:30:0', 'Chicago', 'San Francisco', 370.00, 3),
  ('2023-09-05', '2:0:0', 'Seattle', 'Portland', 110.00, 6),
  ('2023-09-07', '2:15:0', 'Atlanta', 'Miami', 205.00, 4),
  ('2023-09-09', '5:30:0', 'Houston', 'New York', 550.00, 2),
  ('2023-09-11', '1:30:0', 'Phoenix', 'Las Vegas', 75.00, 5);

INSERT INTO Passengers (passenger_firstname, passenger_lastname, passenger_address, passenger_phone)
VALUES 
  ('John', 'Doe', '123 Main Street, Anytown USA', '555-555-1212'),
  ('Jane', 'Doe', '123 Main Street, Anytown USA', '555-555-1212'),
  ('Bob', 'Smith', '456 Park Ave, Anytown USA', '555-555-1212'),
  ('Sue', 'Jones', '789 Washington St, Anytown USA', '555-555-1212'),
  ('Mike', 'Brown', '1010 Elm St, Anytown USA', '555-555-1212');

INSERT INTO Seats (seat_number, seat_class, airplane_id)
VALUES 
  ('1A', 'First', 1),
  ('1B', 'First', 1),
  ('1C', 'First', 1),
  ('2A', 'Business', 1),
  ('2B', 'Business', 1),
  ('2C', 'Business', 1),
  ('3A', 'Economy', 1),
  ('3B', 'Economy', 1),
  ('3C', 'Economy', 1),
  ('4A', 'Economy', 1),
  ('4B', 'Economy', 1),
  ('4C', 'Economy', 1);

INSERT INTO Reservations (reservation_date, flight_id, passenger_id, seat_id)
VALUES 
  ('2023-09-01', 1, 1, 1),
  ('2023-09-03', 2, 2, 5),
  ('2023-09-07', 4, 3, 11),
  ('2023-09-09', 5, 4, 8),
  ('2023-09-11', 6, 5, 9);