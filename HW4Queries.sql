/*Author: Cooper Stevens
  Due date: 10/19/17
  Class: CS 3810
  Professor: Dr. Cohen
 */

 
 
 --Query #1 How many passengers departed Colorado on all airlines?



SELECT ORIGIN_CITY_NAME, ORIGIN_STATE_NM, ORIGIN, ORIGIN_AIRPORT_ID, CARRIER_NAME, SUM(PASSENGERS)

FROM CarrierEntity NATURAL JOIN Origins NATURAL JOIN OriginNames NATURAL JOIN OriginCityName NATURAL JOIN OriginAirports NATURAL JOIN AircraftSeatsPassengers

where ORIGIN_STATE_NM = 'Colorado'



--Query #2 How much freight departed Colorado?



SELECT ORIGIN_CITY_NAME, ORIGIN_STATE_NM, ORIGIN, ORIGIN_AIRPORT_ID, CARRIER_NAME, SUM(FREIGHT)

FROM CarrierEntity NATURAL JOIN Origins NATURAL JOIN OriginNames NATURAL JOIN OriginCityName NATURAL JOIN OriginAirports NATURAL JOIN Payload

where ORIGIN_STATE_NM = 'Colorado'



--Query #3 How many people arrived in CO from outside CO 



SELECT ORIGIN_CITY_NAME, ORIGIN_STATE_NM, ORIGIN, ORIGIN_AIRPORT_ID, CARRIER_NAME, DEST_STATE_ABR, SUM(PASSENGERS)

FROM CarrierEntity NATURAL JOIN Origins NATURAL JOIN OriginNames NATURAL JOIN OriginCityName NATURAL JOIN OriginAirports NATURAL JOIN AircraftSeatsPassengers NATURAL JOIN DestinationNames

where ORIGIN_STATE_NM != 'Colorado' and DEST_STATE_ABR = 'CO'



--Query #4 

SELECT ORIGIN_CITY_NAME, ORIGIN_STATE_NM, ORIGIN, ORIGIN_AIRPORT_ID, CARRIER_NAME, DEST_STATE_ABR, DISTANCE, SUM(PASSENGERS)

FROM CarrierEntity NATURAL JOIN Origins NATURAL JOIN OriginNames NATURAL JOIN OriginCityName NATURAL JOIN OriginAirports NATURAL JOIN AircraftSeatsPassengers NATURAL JOIN DestinationNames NATURAL JOIN AircraftDistance

where DEST_STATE_ABR = 'CO' and DISTANCE>500 and DISTANCE<1200