✈️ Airline Reservation & Analytics System

A full-stack Airline Reservation and Analytics Web Application built using Django, MySQL, HTML, and CSS.

This project simulates real-world airline operations by managing flights, passengers, bookings, and crew assignments while providing analytical insights through SQL-based reporting and dashboards.

---

🚀 Project Overview

The Airline Reservation & Analytics System combines database management and web application development to provide a complete airline management solution.

The application allows users to:

- Manage flight information
- Register passengers
- Create flight bookings
- Monitor airline operations
- Analyze revenue and booking trends
- Generate business insights using SQL analytics

The project demonstrates practical implementation of relational databases, SQL analytics, and full-stack web development.

---

✨ Features

🎫 Reservation Management

- Add Passengers
- Create Flight Bookings
- View Available Flights
- Store booking information in MySQL

📊 Analytics Dashboard

- Total Flights
- Total Passengers
- Total Bookings
- Total Revenue

💰 Revenue Analytics

- Revenue generated per flight
- Flight performance comparison
- Revenue ranking analysis

👨‍✈️ Crew Management

- Store crew information
- Assign crew members to flights
- Track crew assignments

---

🛠️ Technology Stack

Frontend

- HTML5
- CSS3

Backend

- Django

Database

- MySQL Server 8.0

Development Tools

- VS Code
- MySQL Workbench
- Git
- GitHub

---

🗄️ Database Schema

Flights

Column| Description
flight_id| Unique flight identifier
flight_number| Flight code
source_city| Departure city
destination_city| Arrival city
departure_time| Departure schedule
arrival_time| Arrival schedule
total_seats| Available seats
ticket_price| Ticket fare

---

Passengers

Column| Description
passenger_id| Unique passenger identifier
first_name| Passenger first name
last_name| Passenger last name
email| Passenger email
phone| Contact number

---

Bookings

Column| Description
booking_id| Unique booking identifier
flight_id| Linked flight
passenger_id| Linked passenger
seat_number| Assigned seat
booking_date| Booking timestamp
fare_paid| Fare amount

---

Crew

Column| Description
crew_id| Unique crew identifier
crew_name| Crew member name
role| Pilot / Cabin Crew

---

Crew_Assignments

Column| Description
assignment_id| Assignment identifier
crew_id| Assigned crew
flight_id| Assigned flight

---

📂 Project Structure

Airline-Reservation-Analytics/

├── airline/
│   ├── models.py
│   ├── views.py
│   └── urls.py
│
├── templates/
│   ├── home.html
│   ├── add_passenger.html
│   ├── add_booking.html
│   ├── flights.html
│   ├── dashboard.html
│   └── analytics.html
│
├── static/
│   ├── css/
│   │   └── style.css
│   └── images/
│
├── sql/
│   ├── create_tables.sql
│   ├── insert_data.sql
│   ├── analytics_queries.sql
│   ├── ranking_queries.sql
│   └── stored_procedures.sql
│
├── screenshots/
│
├── requirements.txt
├── manage.py
└── README.md

---

📊 SQL Concepts Implemented

Basic Queries

- SELECT
- WHERE
- ORDER BY

Aggregate Functions

- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

Joins

- INNER JOIN
- LEFT JOIN

Grouping

- GROUP BY

Subqueries

- Maximum ticket price analysis
- Above-average fare analysis
- Passenger lookup by flight

Window Functions

- RANK()
- DENSE_RANK()

Stored Procedures

- GetFlightBookings()

---

📈 Sample Analytics Queries

Revenue by Flight

SELECT
    f.flight_number,
    SUM(b.fare_paid) AS revenue
FROM Flights f
JOIN Bookings b
ON f.flight_id = b.flight_id
GROUP BY f.flight_number
ORDER BY revenue DESC;

Flight Revenue Ranking

SELECT
    f.flight_number,
    SUM(b.fare_paid) AS revenue,
    RANK() OVER (
        ORDER BY SUM(b.fare_paid) DESC
    ) AS revenue_rank
FROM Flights f
JOIN Bookings b
ON f.flight_id = b.flight_id
GROUP BY f.flight_number;

Dense Revenue Ranking

SELECT
    f.flight_number,
    SUM(b.fare_paid) AS revenue,
    DENSE_RANK() OVER (
        ORDER BY SUM(b.fare_paid) DESC
    ) AS revenue_rank
FROM Flights f
JOIN Bookings b
ON f.flight_id = b.flight_id
GROUP BY f.flight_number;

---

🎯 Learning Outcomes

This project demonstrates:

- Relational Database Design
- Database Normalization
- Primary & Foreign Keys
- SQL Query Development
- Aggregate Functions
- Multi-table Joins
- Subqueries
- Window Functions
- Stored Procedures
- Django CRUD Operations
- Backend Development
- Full-Stack Web Development
- Business Analytics Reporting

---

📸 Application Screenshots

Add screenshots of:

- Home Page
- Add Passenger Page
- Add Booking Page
- Flights Page
- Analytics Dashboard
- Revenue Analytics

---

🔮 Future Enhancements

- User Authentication & Authorization
- Seat Availability Tracking
- Flight Search & Filtering
- Crew Scheduling Dashboard
- Ticket Generation
- Email Notifications
- Interactive Charts & Graphs
- Online Payment Integration

---

🏆 Conclusion

The Airline Reservation & Analytics System successfully demonstrates the integration of database management and web application development. The project provides practical experience in SQL analytics, relational database design, backend development with Django, and business intelligence reporting within a real-world airline management scenario.

---

👩‍💻 Author

Asfiya

GitHub: https://github.com/ASFIYA11