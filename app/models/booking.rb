class Booking < ActiveRecord::Base

	enum room_type: ["Deluxe Rooms", "Luxury Rooms", "Luxury suites","Presidential Suites"]

	belongs_to :room
	validates :room_id, presence: :true
	validate :last_date_greater_than_start_date_and_smaller_six_month
	before_validation :rooms_are_available

	# validation on dates 
  def last_date_greater_than_start_date_and_smaller_six_month 
    # last_date should be smaller than 6 months
    if Date.today + 6.months < last_date.to_date 
      errors.add(:last_date, "last date is greater than 6 months")
    # last_date should be greater than start_date
    elsif last_date.to_date < start_date.to_date
      errors.add(:last_date, "last date is smaller than start date")
    end
  end

	# get the all the room_id which room are booked in between start_date and last_date
  def self.excluded_id(start_date,last_date)
    # if array is empty return  true else return the array
    if (b= Booking.where("start_date < ? AND last_date > ? ", last_date,start_date).collect(&:room_id)).empty?
      return true
    else
      return b
    end
  end

  def rooms_are_available
  	if (rooms = Room.avail_rooms(start_date, last_date, room_type).limit(1)).length > 0
  		self.room_id = rooms.first.id
		else
			errors.add(:num_of_user, "Rooms are not available #{room_type}")
		end
  end
end
