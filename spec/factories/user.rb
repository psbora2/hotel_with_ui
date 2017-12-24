# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do 
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'testing123'
    created_at 2.day.ago
    updated_at 1.day.ago
	end
end