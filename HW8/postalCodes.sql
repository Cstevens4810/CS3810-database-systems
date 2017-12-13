/*
  Author: Cooper Stevens
  Due date: 12/12/17
  Class: CS 3810
  Professor: Dr. Cohen
*/

--Copies the information 
COPY usa.postalcodes FROM './data'
WITH (FORMAT csv, HEADER True, QUOTE '"');

--This creates the points for the postal codes
SELECT AddGeometryColumn('usa','postalcodes','geom',0,'POINT',2);

--Insert classroster
INSERT INTO usa.classroster (last,first,postalcode) VALUES ('Stevens','Cooper',80241);
INSERT INTO usa.classroster (last,first,postalcode) VALUES ('Phillips','Kyra',80241);
INSERT INTO usa.classroster (last,first,postalcode) VALUES ('Stevens','Amy',80111);
INSERT INTO usa.classroster (last,first,postalcode) VALUES ('Stevens','John',80111);
INSERT INTO usa.classroster (last,first,postalcode) VALUES ('Stevens','Marjorie',18069);
INSERT INTO usa.classroster (last,first,postalcode) VALUES ('Mccarty','Mike',80906);

--Update the postal code data so it can be viewed... 
UPDATE usa.postalcodes
SET geom = 'POINT(' || postalcodes.long|| ' ' || postalcodes.lat || ')';

/*
Using the query builder in QGIS we created the layer witht the points for the postal codes. Here is that code
*/

"code"  LIKE  '%80111%'  
OR  "code"  LIKE '%80241%'
OR  "code"  LIKE '%80111%' 
OR  "code"  LIKE '%18069%'
OR  "code"  LIKE '%80906%'
