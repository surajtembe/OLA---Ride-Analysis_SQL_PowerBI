use Ola;

-- 1. Retrieve all successful bookings:
SELECT 
	* 
FROM bookings
WHERE Booking_Status = 'Success';

-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT 
	Vehicle_Type,
	AVG(Ride_Distance) 
FROM bookings
GROUP BY Vehicle_Type;
SELECT * FROM ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
SELECT 
	COUNT(*)
FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW top_five_customers AS
SELECT 
	Customer_ID,
	COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY 2 DESC LIMIT 5;
SELECT * FROM top_five_customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues: 
SELECT 
	COUNT(*) 
FROM bookings
WHERE Canceled_Rides_By_Driver = 'Personal & Car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT 
	Vehicle_Type,
    MAX(Driver_Ratings) AS max_driver_rating,
    MIN(Driver_Ratings) AS min_driver_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';
 
-- 7. Retrieve all rides where payment was made using UPI:
SELECT 
	*
FROM bookings
WHERE Payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type:
SELECT 
	Vehicle_Type,
    ROUND(AVG(Customer_Rating), 2) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:
SELECT 
	SUM(Booking_Value) AS successfull_booking_value_total
FROM bookings
WHERE Booking_Status = 'Success';

-- 10. List all incomplete rides along with the reason:
SELECT
	Booking_ID,
    Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';