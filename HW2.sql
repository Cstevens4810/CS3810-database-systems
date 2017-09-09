/*Author: Cooper Stevens
  Due date: 9/7/17
  Class: CS 3810
  Professor: Dr. Blanch
 */

--Problem 2 Create a table called Countries
CREATE TABLE Countries ( 
name VARCHAR(20) NOT NULL PRIMARY KEY,  
latitude VARCHAR(20),  
longitude VARCHAR(20),   
area INT, 
population INT,  
gdp INT,  
gdpYear INT
); 


--4a Create a Borders table
CREATE TABLE Borders (
name VARCHAR(20),
borderCountries VARCHAR(20);


--4b Populate both tables
INSERT INTO Countries
VALUES('Austria', '47 20 N', '13 20 E', 83871, 8754413, 47900, 2016);

INSERT INTO Countries
VALUES ('Belgium','50 50 N','4 00 E', 30528, 11491346, 44900, 2016);

INSERT INTO Countries
VALUES('Czech Republic', '49 45 N', '15 30 E', 78867, 10674723, 33200, 2016);

INSERT INTO Countries
VALUES('France', '46 00 N', '2 00', 643801, 67106161, 42400, 2016);

INSERT INTO Countries
VALUES('Germany', '51 00 N', '9 00 E', 357022, 80594017, 48200, 2016);

INSERT INTO Countries
VALUES('Luxemburg', '49 45 N', '6 10 N', 2586, 594130, 102000, 2016);

INSERT INTO Countries
VALUES('Netherlands', '52 30 N', '5 45 E', 41543, 17084719, 50800, 2016);

INSERT INTO Countries
VALUES('Poland', '52 00 N', '20 00 E', 312685, 38476269, 27700, 2016);

INSERT INTO Countries
VALUES('Switzerland', '47 00 N', '8 00 E', 41277, 8236303, 59400, 2016);

INSERT INTO Borders 
VALUES ('Germany', 'Netherlands, Belgium,Luxemburg Poland, Czechia, Austria, France, Switzerland');

INSERT INTO Borders 
VALUES ('Netherlands', 'Belgium, Germany');

INSERT INTO Borders 
VALUES ('Belgium', 'Netherlands, Germany, Luxemburg, France');

INSERT INTO Borders 
VALUES ('Luxemburg', 'Germany, Belgium, France');

INSERT INTO Borders 
VALUES ('Poland' , 'Germany, Czechia');

INSERT INTO Borders 
VALUES ('Czechia', 'Poland, Germany, Austria');

INSERT INTO Borders 
VALUES ('Austria', 'Czechia, Switzerland, Germany');

INSERT INTO Borders 
VALUES ('France', 'Belgium, Luxemburg, Germany, Switzerland');

INSERT INTO Borders 
VALUES ('Switzerland', 'France, Germany, Austria');


--4c Use query to display all countries that border Germany
SELECT * FROM Borders
WHERE name = 'Germany';


 -- 4dUse query to display all countries that have a population greater than 100 million
SELECT * FROM Countries
WHERE population > 10000000;


--4e Use query to display all countries that a have a population greater than 100 million AND border Germany
SELECT Countries.name, Borders.borderCountries
FROM Countries, Borders
WHERE (Countries.population > 35000000) AND (Borders.countryName = 'Germany');
