class ChargesController < ApplicationController
  before_action :set_booking, only: [:new]

  def new
  end

  def create
    @booking = Booking.find_by_id(session[:booking_id])
    charge_status = ChargesService.new(@booking, params).charge
    redirect_to booking_path(@booking), notice: "Payment: #{charge_status}" and return
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path(booking_id: @booking.id)
  end

  private

  def set_booking
    if params["booking_id"].blank?
      redirect_to root_path, notice: 'Must pay charges from a Booking' and return
    end

    session[:booking_id] = params["booking_id"]
    @booking = Booking.find_by_id(params["booking_id"])
    @amount = @booking.charges_in_cents
    @amount_dollars = @booking.total_charges
    @description = @booking.description

  end
end
