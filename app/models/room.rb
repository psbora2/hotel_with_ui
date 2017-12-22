class Room < ActiveRecord::Base
	enum room_type: ["Deluxe Rooms", "Luxury Rooms", "Luxury suites","Presidential Suites"]
	has_and_belongs_to_many :bookings

  scope :avail_rooms, -> (start_date, last_date, room_type) do 
    where("room_type = ? AND id NOT IN (?)", Room.room_types[room_type], Booking.excluded_id(start_date, last_date))
  end
end
