from django.shortcuts import render
from .models import Flight, Passenger, Booking
from datetime import datetime
from django.db.models import Sum
from django.db import connection


def home(request):
    return render(request, 'home.html')


def passenger(request):

    if request.method == 'POST':

        Passenger.objects.create(
            first_name=request.POST['first_name'],
            last_name=request.POST['last_name'],
            email=request.POST['email'],
            phone=request.POST['phone']
        )

        return render(
            request,
            'add_passenger.html',
            {
                'message': 'Passenger Added Successfully'
            }
        )

    return render(
        request,
        'add_passenger.html'
    )


def booking(request):

    if request.method == 'POST':

        Booking.objects.create(
            flight_id=request.POST['flight_id'],
            passenger_id=request.POST['passenger_id'],
            seat_number=request.POST['seat_number'],
            booking_date=datetime.now(),
            fare_paid=request.POST['fare_paid']
        )

        return render(
            request,
            'add_booking.html',
            {
                'message': 'Booking Added Successfully'
            }
        )

    return render(
        request,
        'add_booking.html'
    )


def flights(request):

    flights_data = Flight.objects.all()

    return render(
        request,
        'flights.html',
        {
            'flights': flights_data
        }
    )


def dashboard(request):

    total_flights = Flight.objects.count()

    total_passengers = Passenger.objects.count()

    total_bookings = Booking.objects.count()

    total_revenue = (
        Booking.objects.aggregate(
            total=Sum('fare_paid')
        )['total']
        or 0
    )

    return render(
        request,
        'dashboard.html',
        {
            'total_flights': total_flights,
            'total_passengers': total_passengers,
            'total_bookings': total_bookings,
            'total_revenue': total_revenue,
        }
    )


def analytics(request):

    with connection.cursor() as cursor:

        cursor.execute("""
            SELECT
                f.flight_number,
                SUM(b.fare_paid) AS revenue
            FROM Flights f
            JOIN Bookings b
                ON f.flight_id = b.flight_id
            GROUP BY f.flight_number
            ORDER BY revenue DESC
        """)

        rows = cursor.fetchall()

    revenue_data = []

    for row in rows:

        revenue_data.append({
            'flight_number': row[0],
            'revenue': row[1]
        })

    return render(
        request,
        'analytics.html',
        {
            'revenue_data': revenue_data
        }
    )