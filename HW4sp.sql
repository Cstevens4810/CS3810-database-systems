/*Author: Cooper Stevens
  Due date: 10/19/17
  Class: CS 3810
  Professor: Dr. Cohen
 */
CREATE FUNCTION FlightAnalyzer()

	declare carrierName	varchar(70);

			totalFlights int;

			avgDistance float;

			passengersToDistance float;

			freightToDistance float;

			corrCoefPtoD int;

			corrCoefFtoD int;



	return varchar(70) AS carrierNameR, 

			int AS totalFlightsR, 

			float AS avgDistanceR,

			float AS passengersToDistanceR,

			float AS freightToDistanceR,

			int AS corrCoeffPassengersToDistanceR,

			int AS corrCoeffFreightToDistanceR,



BEGIN

	SELECT DISTINCT UNIQUE_CARRIER_NAME FROM Carrier into carrierName;

	SELECT count(*) FROM FlightSummary WHERE FlightSummary.UNIQUE_CARRIER_NAME = carrierName into totalFlights;

	SELECT avg(Distance) FROM FlightSummary WHERE FlightSummary.UNIQUE_CARRIER_NAME = carrierName into avgDistance;

	SELECT passengers / Distance FROM FlightSummary WHERE FlightSummary.UNIQUE_CARRIER_NAME = carrierName into passengersToDistance;

	SELECT freight / Distance FROM FlightSummary WHERE FlightSummary.UNIQUE_CARRIER_NAME = carrierName into freightToDistance; 

	

	if passengersToDistance > 1

	THEN corrCoefPToD = 1;

	ELSE corrCoefPToD = -1;

	END if;



	if freightToDistance > 1

	THEN corrCoefFToD = 1;

	ELSE corrCoefFToD = -1;

	END if;



END