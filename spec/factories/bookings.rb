FactoryGirl.define do
  factory :booking do
    user_id 1
    hotel_id 1
    room_id 1
    check_in_date DateTime.now
    check_out_date DateTime.now + 3.days
  end
end
