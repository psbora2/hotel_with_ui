class AddNumOfUserToBookings < ActiveRecord::Migration[4.2]
  def change
    add_column :bookings, :num_of_user, :integer
  end
end
