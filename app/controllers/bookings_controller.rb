class BookingsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :index, :show]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = current_user.bookings.includes(:room).paginate(page: params[:page], per_page: 10)
  end

  def home
    @booking = Booking.new
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    if @booking
      @room = @booking.room
    else
      redirect_to root_path
    end
  end

  # GET /bookings/new
  def new
    @booking = Booking.new(room_type: params[:room_type].to_i)
  end

  # # GET /bookings/1/edit
  # def edit
  # end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = current_user.bookings.build(booking_params)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new}
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  # def update
  #   respond_to do |format|
  #     if @booking.update(booking_params_with_date)
  #       format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @booking }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @booking.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /bookings/1
  # # DELETE /bookings/1.json
  # def destroy
  #   @booking.destroy
  #   respond_to do |format|
  #     format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      debugger
      @booking = current_user.bookings.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params["booking"]["room_type"] = params["booking"]["room_type"].to_i if params["booking"]["room_type"].present?
      params.require(:booking).permit(:room_type, :room_id, :start_date, :last_date, :num_of_user)
    end
end
