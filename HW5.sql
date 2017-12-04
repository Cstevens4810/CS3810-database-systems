/*Author: Cooper Stevens
  Due date: 10/26/17
  Class: CS 3810
  Professor: Dr. Cohen
 */


CREATE TABLE Customer(
	email VARCHAR(150),
	firstName VARCHAR(60),
	lastName VARCHAR(60),
	street VARCHAR(100),
	postalCode INT, 
	primary key(email)
);

CREATE TABLE PhoneNumbers(
	countryCode INT,
	areaCode INT,
	localNumber INT,
	email VARCHAR(150),
	foreign key(email) REFERENCES Customer(email)
);

CREATE TABLE Airline(
	AirlineName VARCHAR(100),
	AirlineCode INT,
	country VARCHAR(30),
	primary key(AirlineCode)
);

CREATE TABLE Flight(
	originAirportCode INT,
	destAirportCode INT,
	AirlineCode INT,
	uniqueFlightNum INT,
	deptDate VARCHAR(10),
	deptHour INT,
	deptMin INT,
	arrivalDate VARCHAR(10),
	arrivalHour INT,
	arrivalMin INT, 
	primary key (uniqueFlightNum),
	foreign key (AirlineCode) REFERENCES Airline(AirlineCode),
	foreign key (originAirportCode) REFERENCES Airports(airportCode),
	foreign key (destAirportCode) REFERENCES Airports(airportCode)
);

--This is meant to correct the origin and destination code, there is now a table that will reference the airport and show where it is 

CREATE TABLE Airports(
	airportCode INT,
	cityName VARCHAR(20),
	stateCode VARCHAR(5),
	countryName VARCHAR(50),
	primary key (airportCode)
);

CREATE TABLE Booking(
	bookingNum INT,
	cityCodeOfBooking INT,
	uniqueFlightNum INT,
	payingCustomerEmail VARCHAR(150),
	primary key (bookingNum),
	foreign key (uniqueFlightNum) REFERENCES Flight(uniqueFlightNum)
);

CREATE TABLE Tickets(
	bookingNum INT,
	email VARCHAR(100),
	foreign key(email) REFERENCES Customer(email)
);
