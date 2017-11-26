/* Author: Cooper Stevens
   Due Date: 10/8/2017 - resubmitted 11/26/2017
   Assignment: Homework Assignment #3
*/

-- Create SQL Statements, part one 

CREATE TABLE Airline(AIRLINE_ID VARCHAR(10),CARRIER VARCHAR(10),CARRIER_ENTITY VARCHAR(10),CARRIER_NAME VARCHAR(200), UNIQUE_CARRIER VARCHAR(100), UNIQUE_CARRIER_ENTITY VARCHAR(100),
	 UNIQUE_CARRIER_NAME VARCHAR(200), WAC VARCHAR(50), CARRIER_GROUP VARCHAR(50), CARRIER_GROUP_NEW VARCHAR(100), REGION VARCHAR(150), START_DATE_SOURCE VARCHAR(150), 
	 THRU_DATE_SOURCE VARCHAR(150), 
	 FOREIGN KEY (UNIQUE_CARRIER_ENTITY) REFERENCES Carrier (UNIQUE_CARRIER_ENTITY) );

CREATE TABLE Carrier (UNIQUE_CARRIER_ENTITY VARCHAR(10), WAC VARCHAR(5), CARRIER_GROUP VARCHAR(5), PRIMARY KEY (UNIQUE_CARRIER_ENTITY));

CREATE TABLE UniqueCarrierName (UNIQUE_CARRIER VARCHAR(200), UNIQUE_CARRIER_NAME VARCHAR(200), PRIMARY KEY (UNIQUE_CARRIER));

CREATE TABLE CarrierRelation (UNIQUE_CARRIER VARCHAR(100), CARRIER VARCHAR(100), 
	FOREIGN KEY(UNIQUE_CARRIER) REFERENCES Carrier(UNIQUE_CARRIER_ENTITY), FOREIGN KEY (CARRIER) REFERENCES UniqueCarrierName(UNIQUE_CARRIER) );

CREATE TABLE Airport (AIRPORT_ID VARCHAR(10), AIRPORT_SEQ_ID VARCHAR(10), CITY_MARKET_ID VARCHAR(10), AIRPORT_WAC VARCHAR(5), PRIMARY KEY(AIRPORT_ID));

CREATE TABLE Cities (CITY_MARKET_ID VARCHAR(100), CITY_NAME VARCHAR(200), STATE_FIPS VARCHAR(200), PRIMARY KEY (CITY_MARKET_ID));

CREATE TABLE States (STATE_FIPS VARCHAR(5), STATE_NAME VARCHAR(15), STATE VARCHAR(5), PRIMARY KEY (STATE_FIPS));

CREATE TABLE Passengers (UNIQUE_CARRIER_ENTITY VARCHAR(10), ORIGIN_AIRPORT_ID VARCHAR(10), DEST_AIRPORT_ID VARCHAR(10), PASSENGERS VARCHAR(5), 
	FOREIGN KEY(UNIQUE_CARRIER_ENTITY) REFERENCES Carrier(UNIQUE_CARRIER_ENTITY), FOREIGN KEY (ORIGIN_AIRPORT_ID) REFERENCES Airport(AIRPORT_ID), FOREIGN KEY (DEST_AIRPORT_ID) REFERENCES Airport(AIRPORT_ID));

CREATE TABLE Freight (UNIQUE_CARRIER_ENTITY VARCHAR(100), ORIGIN_AIRPORT_ID VARCHAR(100), DEST_AIRPORT_ID VARCHAR(100), FREIGHT VARCHAR(50),
	FOREIGN KEY(UNIQUE_CARRIER_ENTITY) REFERENCES Carrier(UNIQUE_CARRIER_ENTITY), FOREIGN KEY (ORIGIN_AIRPORT_ID) REFERENCES Airport(AIRPORT_ID), FOREIGN KEY (DEST_AIRPORT_ID) REFERENCES Airport(AIRPORT_ID));

CREATE TABLE Mail (UNIQUE_CARRIER_ENTITY VARCHAR(100), ORIGIN_AIRPORT_ID VARCHAR(100), DEST_AIRPORT_ID VARCHAR(100), MAIL VARCHAR(50),
	FOREIGN KEY(UNIQUE_CARRIER_ENTITY) REFERENCES Carrier(UNIQUE_CARRIER_ENTITY), FOREIGN KEY (ORIGIN_AIRPORT_ID) REFERENCES Airport(AIRPORT_ID), FOREIGN KEY (DEST_AIRPORT_ID) REFERENCES Airport(AIRPORT_ID));
