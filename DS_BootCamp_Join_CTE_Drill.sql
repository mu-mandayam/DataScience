/* Drills

1. What are the three longest trips on rainy days?
2. Which station is full most often?
3. Return a list of stations with a count of number of trips starting at that station but ordered by dock count.
4. (Challenge) What's the length of the longest trip for each day it rains anywhere?

*/

/* 1. What are the three longest trips on rainy days? */

SELECT 		
		start_date,
		duration
FROM		
		trips
JOIN	
		weather
ON		
		LEFT(start_date, 10) = Date AND
		Events = 'Rain'
ORDER BY duration DESC LIMIT 3;

/* 2. Which station is full most often? */

SELECT
		status.station_id,
		COUNT(*) as st_count,
		stations.name
FROM	
		status
JOIN
		stations
ON
		status.station_id = stations.station_id
WHERE 	status.bikes_available = 0
GROUP BY status.station_id, stations.name
ORDER BY st_count DESC

/* 3. Return a list of stations with a count of number of trips starting at that station but ordered by dock count. */

SELECT	
		start_terminal,
		COUNT(*) AS tr_count,
		stations.name,
		stations.dockcount
FROM
		trips
JOIN
		stations
ON
		trips.start_terminal = stations.station_id 
GROUP BY trips.start_terminal, stations.name, stations.dockcount
ORDER BY dockcount ASC

/* 4. (Challenge) What's the length of the longest trip for each day it rains anywhere? */

SELECT 
		start_station,
		LEFT(trips.start_date, 10),
		MAX(duration) AS max_time
FROM 
		trips
JOIN
		weather
ON
		LEFT(trips.start_date, 10) = weather.Date
WHERE
		weather.Events = 'Rain'
GROUP BY trips.start_station, LEFT(trips.start_date, 10)




