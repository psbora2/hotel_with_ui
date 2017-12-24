class Room < ActiveRecord::Base
	enum room_type: ["Deluxe Rooms", "Luxury Rooms", "Luxury suites","Presidential Suites"]
	has_and_belongs_to_many :bookings

  def self.avail_rooms(start_date, last_date, room_type)
  	if Booking.excluded_id(start_date, last_date)
  		self.where("room_type = ? AND id NOT IN (?)", Room.room_types[room_type], Booking.excluded_id(start_date, last_date))
  	else
  		self.where("room_type = ?", Room.room_types[room_type])
  	end
  end

  def room_type_int
    self.class.room_types[self.room_type]
  end
end
