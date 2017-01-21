require 'rails_helper'

describe "users/index", type: :view do
  before(:each) do
    sign_in user
  end

  let!(:user) { FactoryGirl.create(:user) }

  it "renders a list of users" do
    render
    expect(rendered).to include('Bookings Dashboard')
    expect(rendered).to include('<div id="calendar-container">')
    expect(rendered).to include("<div data-token=\"#{user.authentication_token}\" data-userid=\"#{user.id}\" id=\"bookings-calendar\">")
  end
end
