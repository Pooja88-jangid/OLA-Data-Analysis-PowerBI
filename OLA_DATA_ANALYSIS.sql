CREATE database OLA;
use OLA;
#.Retrieve all successful bookings?
select * from booking
where Booking_Status = 'Success';

create view Succesfully_Bookings as
select * from booking 
where Booking_Status = 'Success';

select * from Succesfully_Bookings;

#. Find the average ride distance for each vehicle type?
create view Avg_Distance as
select Vehicle_Type, avg(Ride_Distance)
as average_distance from booking
group by Vehicle_Type;

select * from Avg_Distance;

#3. Get the total number of cancelled rides by customers?
select count(*) from booking
where Booking_Status = "Canceled by customer";

create view canceled_rides_by_customer as
select count(*) from booking
where Booking_Status = "Canceled by customer";

select * from canceled_rides_by_customer;

#4. List the top 5 customers who booked the highest number of rides?
create view Top_5_Customer as
select Customer_ID,count(Booking_ID) as total_rides
from booking
group by Customer_ID
order by total_rides desc limit 5;

select * from Top_5_Customer;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues?
Create view Cancelled_Rides_by_Driver as
select count(*) from booking
where Canceled_Rides_by_Driver = "Personal & Car-related issues";
select * from Cancelled_Rides_by_Driver;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings?
Create view Max_and_Min_Driver_Ratings_for_Prime_Sedan as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from booking where Vehicle_Type = "Prime_Sedan";
#7. Retrieve all rides where payment was made using UPI?
select * from Max_and_Min_Driver_Ratings_for_Prime_Sedan;
Create view Upi_Payments as
select * from booking 
where Payment_Method = "UPI";
select * from Upi_Payments;

#8. Find the average customer rating per vehicle type?
select Vehicle_Type, avg(Customer_Rating) as avg_rating
from booking 
group by Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully?
select sum(Booking_Value) as total_successful_value 
from booking
where Booking_Status = "Success";

#10. List all incomplete rides along with the reason?
create view Incomplete_Rides as
select Booking_ID, Incomplete_Rides_Reason
from booking
where Incomplete_Rides = "Yes";

select * from Incomplete_Rides;







