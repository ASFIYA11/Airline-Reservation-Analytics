CREATE DATABASE AirlineDB;
USE AirlineDB;
CREATE TABLE Flights (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(20) UNIQUE,
    source_city VARCHAR(50),
    destination_city VARCHAR(50),
    departure_time DATETIME,
    arrival_time DATETIME,
    total_seats INT,
    ticket_price DECIMAL(10,2)
);
show tables;
INSERT INTO Flights
(flight_number, source_city, destination_city,
departure_time, arrival_time, total_seats, ticket_price)
VALUES
('AI101','Delhi','Mumbai','2025-07-10 08:00:00','2025-07-10 10:00:00',180,5000),
('AI102','Mumbai','Bangalore','2025-07-10 12:00:00','2025-07-10 14:00:00',180,4500),
('AI103','Delhi','Bangalore','2025-07-11 09:00:00','2025-07-11 12:00:00',200,6000),
('AI104','Chennai','Delhi','2025-07-11 13:00:00','2025-07-11 16:00:00',180,5500),
('AI105','Hyderabad','Mumbai','2025-07-12 07:00:00','2025-07-12 09:00:00',160,4800),
('AI106','Mumbai','Delhi','2025-07-12 15:00:00','2025-07-12 17:00:00',180,5000),
('AI107','Bangalore','Chennai','2025-07-13 08:30:00','2025-07-13 10:00:00',150,3500),
('AI108','Delhi','Kolkata','2025-07-13 11:00:00','2025-07-13 13:30:00',170,5200),
('AI109','Kolkata','Mumbai','2025-07-14 09:00:00','2025-07-14 11:30:00',180,5100),
('AI110','Chennai','Hyderabad','2025-07-14 14:00:00','2025-07-14 15:30:00',150,4000);
SELECT * FROM Flights;


CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);
INSERT INTO Passengers
(first_name,last_name,email,phone)
VALUES
('Rahul','Sharma','rahul@gmail.com','9000000001'),
('Priya','Reddy','priya@gmail.com','9000000002'),
('Arjun','Kumar','arjun@gmail.com','9000000003'),
('Neha','Patel','neha@gmail.com','9000000004'),
('Rohit','Singh','rohit@gmail.com','9000000005'),
('Aisha','Khan','aisha@gmail.com','9000000006'),
('Vikram','Das','vikram@gmail.com','9000000007'),
('Sneha','Rao','sneha@gmail.com','9000000008'),
('Ankit','Verma','ankit@gmail.com','9000000009'),
('Pooja','Nair','pooja@gmail.com','9000000010');
SELECT * FROM Passengers;


CREATE TABLE Crew (
    crew_id INT PRIMARY KEY AUTO_INCREMENT,
    crew_name VARCHAR(100),
    role VARCHAR(50)
);
INSERT INTO Crew (crew_name, role)
VALUES
('Captain Raj','Pilot'),
('Captain Aman','Pilot'),
('Captain Arvind','Pilot'),
('Vikram Das','Co-Pilot'),
('Rohan Mehta','Co-Pilot'),
('Anjali Rao','Cabin Crew'),
('Sneha Sharma','Cabin Crew'),
('Priyanka Nair','Cabin Crew'),
('Deepika Singh','Cabin Crew'),
('Kavita Iyer','Cabin Crew');
SELECT * FROM Crew;


SELECT * FROM Flights;
SELECT * FROM Passengers;
SELECT * FROM Crew;

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_id INT,
    passenger_id INT,
    seat_number VARCHAR(10),
    booking_date DATETIME,
    fare_paid DECIMAL(10,2),

    FOREIGN KEY (flight_id)
        REFERENCES Flights(flight_id),

    FOREIGN KEY (passenger_id)
        REFERENCES Passengers(passenger_id)
);
DESCRIBE Bookings;
INSERT INTO Bookings
(flight_id, passenger_id, seat_number, booking_date, fare_paid)
VALUES
(1,1,'A1',NOW(),5000),
(1,2,'A2',NOW(),5000),

(2,3,'B1',NOW(),4500),
(2,4,'B2',NOW(),4500),

(3,5,'C1',NOW(),6000),
(3,6,'C2',NOW(),6000),

(4,7,'D1',NOW(),5500),
(4,8,'D2',NOW(),5500),

(5,9,'E1',NOW(),4800),
(5,10,'E2',NOW(),4800);
SELECT * FROM Bookings;



CREATE TABLE Crew_Assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    crew_id INT,
    flight_id INT,

    FOREIGN KEY (crew_id)
        REFERENCES Crew(crew_id),

    FOREIGN KEY (flight_id)
        REFERENCES Flights(flight_id)
);
DESCRIBE Crew_Assignments;
INSERT INTO Crew_Assignments (crew_id, flight_id)
VALUES
(1,1),
(4,1),
(6,1),

(2,2),
(5,2),
(7,2),

(3,3),
(4,3),
(8,3),

(1,4),
(5,4),
(9,4);
SELECT * FROM Crew_Assignments;
