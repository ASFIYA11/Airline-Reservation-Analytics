from django.db import models


class Flight(models.Model):
    flight_id = models.AutoField(primary_key=True)
    flight_number = models.CharField(max_length=20)
    source_city = models.CharField(max_length=50)
    destination_city = models.CharField(max_length=50)
    departure_time = models.DateTimeField()
    arrival_time = models.DateTimeField()
    total_seats = models.IntegerField()
    ticket_price = models.DecimalField(
        max_digits=10,
        decimal_places=2
    )

    class Meta:
        db_table = 'Flights'
        managed = False


class Passenger(models.Model):
    passenger_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.CharField(max_length=100)
    phone = models.CharField(max_length=20)

    class Meta:
        db_table = 'Passengers'
        managed = False


class Booking(models.Model):
    booking_id = models.AutoField(primary_key=True)

    flight_id = models.IntegerField()
    passenger_id = models.IntegerField()

    seat_number = models.CharField(max_length=10)

    booking_date = models.DateTimeField()

    fare_paid = models.DecimalField(
        max_digits=10,
        decimal_places=2
    )

    class Meta:
        db_table = 'Bookings'
        managed = False