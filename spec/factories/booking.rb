FactoryGirl.define do
  factory :booking do 
  	user_id {Factory(:user).id}
  	room_id "AO1"
  	room_type 0
  	num_of_user 1
  	created_at Time.now
  	updated_at Time.now
  	start_date Date.today.to_s
  	last_date (Date.today + 10.days).to_s
	end
end