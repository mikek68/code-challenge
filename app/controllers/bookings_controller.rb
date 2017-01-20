class BookingsController < ApplicationController
  serialization_scope :view_context
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  def index
    respond_to do |format|
      format.html {redirect_to :root}
      format.json { render json: Booking.where(user_id: params[:user_id]) }
    end
  end

  # GET /bookings/1
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new(user_id: params[:user_id])
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_params
      params.require(:booking)
            .permit(:user_id, :hotel_id, :room_id, :check_in_date, :check_out_date, :stay_description)
    end
end
