use CityAirport;
go
CREATE VIEW FlightEdit AS
SELECT flights.*, airplanes.airplane_name
FROM flights
JOIN airplanes ON flights.airplane_id = airplanes.airplane_id;