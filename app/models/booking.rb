class Booking < ActiveRecord::Base

	enum room_type: ["Deluxe Rooms", "Luxury Rooms", "Luxury suites","Presidential Suites"]

	belongs_to :room
  belongs_to :user

  before_validation :rooms_are_available

	validate :last_date_greater_than_start_date_and_smaller_six_month
  validates :user_id, :start_date, :last_date, presence: true
  validates_format_of :start_date, :last_date, :with => /\d{4}\-\d{2}\-\d{2}/, :message => "^Date must be in the following format: mm/dd/yyyy"


  def last_date_greater_than_start_date_and_smaller_six_month 
    if dates_is_blank?
      return true
    elsif Date.today > start_date.to_date
      errors.add(:start_date, "check in date should be greater or equal to today's date")
    # last_date should be smaller than 6 months
    elsif Date.today + 6.months < last_date.to_date 
      errors.add(:last_date, "Check out date should be smaller than 6 months")
    # last_date should be greater than start_date
    elsif last_date.to_date < start_date.to_date
      errors.add(:last_date, "check out date should be greater than Check in Date")
    end
  end

	# get the all the room_id which room are booked in between start_date and last_date
  def self.excluded_id(start_date,last_date)
    # if array is empty return  true else return the array
    if (b= Booking.where("Date(start_date) < ? AND Date(last_date) > ? ", last_date,start_date).collect(&:room_id)).empty?
      return false
    else
      return b
    end
  end

  def rooms_are_available
    if dates_is_blank?
      return true
    # last_date should be smaller than 6 months
  	elsif (rooms = Room.avail_rooms(start_date, last_date, room_type).limit(1)).length > 0
  		self.room_id = rooms.first.id
		else

			errors.add(:num_of_user, "Rooms are not available #{room_type}")
		end
  end

  def dates_is_blank?
    if start_date.blank? || last_date.blank?
      return true
    end
  end

  def room_type_int
    self.class.room_types[self.room_type]
  end
end
