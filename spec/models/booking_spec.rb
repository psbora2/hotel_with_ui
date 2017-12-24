require 'spec_helper'
describe Booking do
  context 'association' do
    it { should belong_to(:room) }
    it { should belong_to(:user) }
  end

	context 'validation' do
    [:user_id, :start_date, :last_date].each do |att|
      it { should validate_presence_of(att) }
    end

    it "should return error if start_date smaller than current date" do
    	room = Factory(:room)
    	booking_1 = Factory.build(:booking, start_date: (Date.today- 10.days).to_s )
    	booking_1.should_not be_valid
    	booking_1.errors[:start_date].should  == ["check in date should be greater or equal to today's date"]
		end

		it "should be valid if start_date greater than current date" do
      room = Factory(:room)   
    	booking_2 = Factory.build(:booking, start_date: (Date.today + 10.days).to_s)
    	booking_2.should be_valid
    end

    it "should return error if start_date greater than last_date" do
     	room = Factory(:room)
    	booking_1 = Factory.build(:booking, start_date: (Date.today).to_s, last_date: (Date.today - 10.days).to_s)
    	booking_1.should_not be_valid
    	booking_1.errors[:last_date].should  == ["check out date should be greater than Check in Date"]
    end

    it "should rbe valid if start_date greater lesser last_date" do
    	room = Factory(:room)
    	booking_1 = Factory.build(:booking, start_date: (Date.today).to_s, last_date: (Date.today + 10.days).to_s)
    	booking_1.should be_valid
    end

    it "should return error if check out date greater than 6 mons" do
    	room = Factory(:room)
    	booking_1 = Factory.build(:booking, start_date: (Date.today).to_s, last_date: (Date.today + 7.months).to_s)
    	booking_1.should_not be_valid
    	booking_1.errors[:last_date].should  == ["Check out date should be smaller than 6 months"]
    end

    it "should return error if rooms are not available" do
    	room = Factory(:room)
    	booking_1 = Factory.build(:booking, room_type: room.room_type, start_date: (Date.today).to_s,last_date: (Date.today + 10.days).to_s)
    	booking_1.save.should ==  true
    	booking_2 = Factory.build(:booking, room_type: room.room_type, start_date: (Date.today).to_s,last_date: (Date.today + 10.days).to_s)
    	booking_2.save.should ==  false
    end
  end

end