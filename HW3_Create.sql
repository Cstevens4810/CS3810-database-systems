/*Author: Cooper Stevens
  Due date: 10/8/17
  Class: CS 3810
  Professor: Dr. Blanch
 */

 CREATE TABLE Aircraft
 {
 	ID INT,
 	Group INT,
 	Type INT,
 	Config INT,
 	Class VARCHAR(4),
 	Seats INT,
 	CONSTRAINT Aircraft_pkey (ID)
 };

 CREATE TABLE Carrier 
 {
 	Unique_Carrier VARCHAR(6),
 	Airline_ID INT, 
 	Unique_Carrier_Name VARCHAR(50),
 	Unique_Carrier_Entity VARCHAR(6),
 	Region VARCHAR(1)
 	CONSTRAINT Carrier_pkey (Unique_Carrier)
 };

 CREATE TABLE Destination 
 {
 	Dest_Airport_ID INT,
 	Dest_Airport_SEQ_ID INT,
 	Dest_City_Market_ID INT,
 	Dest VARCHAR(4),
 	Dest_City_Name VARCHAR(30),
 	Dest_State_Abr VARCHAR(2),
 	Dest_State_Fips INT,
 	Dest_State_Name VARCHAR(20),
 	Dest_WAC INT,
 	CONSTRAINT Destination_pkey (Dest_Airport_ID)
 };

CREATE TABLE Origin 
{
	ORIGIN_AIRPORT_ID INT,
	ORIGIN_AIRPORT_SEQ_ID INT,	
	ORIGIN_CITY_MARKET_ID INT,	
	ORIGIN	VARCHAR(4),
	ORIGIN_CITY_NAME VARCHAR(30),	
	ORIGIN_STATE_ABR VARCHAR(2),	
	ORIGIN_STATE_FIPS INT,
	ORIGIN_STATE_NM VARCHAR(30),
	ORIGIN_WAC INT

};

CREATE TABLE Departure
{
	AIRCRAFT_ID	INT,
	DEPARTURES_PERFORMED INT,	
	PAYLOAD	INT, 
	FREIGHT INT,	
	MAIL INT,	
	YEAR INT,	
	QUARTER INT,	
	MONTH INT

}

CREATE TABLE Flight_Time
{
	AIRCRAFT_ID	DISTANCE INT,
	RAMP_TO_RAMP INT,	
	AIR_TIME INT,
	DISTANCE_GROUP INT

};