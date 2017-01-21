class ChargesService
  def initialize(booking, charges_params)
    @booking = booking
    @amount = @booking.charges_in_cents
    @amount_dollars = @booking.total_charges
    @description = @booking.description
    @params = charges_params
  end

  def charge
    customer = Stripe::Customer.create(
      :email => @params[:stripeEmail],
      :source  => @params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @description,
      :currency    => 'usd'
    )

    charge_status = charge["status"]
    Charge.create(booking_id: @booking.id, amount: @booking.total_charges) if charge_status =~ /succeeded/

    charge_status
  end
end