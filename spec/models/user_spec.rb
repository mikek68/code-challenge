require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many(:bookings) }
  it { is_expected.to have_many(:hotels).through(:bookings) }
  it { is_expected.to have_many(:rooms).through(:bookings) }
end
