# - Create a rails application Hotel to book  Rooms.

 A Hotel  has many rooms.

 The hotel website  allows booking up to 6 months in advance for room reservations

 User can book room in one request by passing  booking date, number of user and room_type

 hotel app show availability of room by passing booking date 

 hotel app show availability of room by passing booking date and room_type

 user can see his booked room and booking information


# - Solution: 

for getting available rooms 

first find which rooms are booked in given date (15-2-2017, 20-2-2017)
  

    Booking.where("start_date < ? AND last_date > ? ", 20-2-2017 , 15-2-2017 )


then exclude these rooms from remaining rooms ("Deluxe Rooms")

    Rooms.where("room_type = ? AND id NOT IN (?)", Room.room_types["Deluxe Rooms"], Booking.where("start_date < ? AND last_date > ? ", 20-2-2017 , 15-2-2017 ).collect(&:id))


#### I think you will like this repository  [Housie](https://github.com/psbora2/housie)
