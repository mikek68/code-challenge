require 'rails_helper'

describe Charge, type: :model do
  it { is_expected.to belong_to(:booking) }
  it { is_expected.to respond_to(:amount) }
end
