class User < ActiveRecord::Base
  # Include default devise modules.
  has_many :bookings
  devise :database_authenticatable, :registerable,
         :rememberable
  include DeviseTokenAuth::Concerns::User
end
