class AddNumOfUserToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :num_of_user, :integer
  end
end
