require 'rails_helper'

describe "charges/new.html.erb", type: :view do
  before(:each) do
    sign_in user
    @booking = assign(:booking, Booking.new(user_id: user.id))
  end

  let!(:user) { FactoryGirl.create(:user) }

  it "renders the edit booking form" do
    render
    expect(rendered).to include('<p class="charge_amount">Amount: $</p>')
    expect(rendered).to include('<p class="charge_description">Description: </p>')
    expect(rendered).to include('<script src="https://checkout.stripe.com/checkout.js" class="stripe-button"')
  end
end
