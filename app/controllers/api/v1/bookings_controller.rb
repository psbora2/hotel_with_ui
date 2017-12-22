class Api::V1::BookingsController < ApplicationController

	def create
		@booking = Booking.new(booking_params_with_date)
		if @booking.save
			render json: @booking, status: :created
		else
			render json: @booking, status: :unprocessable_entity
		end
	end

	def index
		@bookings = Booking.all
		render json: @bookings
	end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:room_type, :room_id, :start_date, :last_date, :num_of_user)
    end

    def booking_params_with_date
      k = booking_params
      k["start_date"] = Date.strptime(k["start_date"], '%m/%d/%Y').to_date
      k["last_date"] = Date.strptime(k["last_date"], '%m/%d/%Y').to_date
      k["room_type"] = k["room_type"].to_i
      return k
    end
end
