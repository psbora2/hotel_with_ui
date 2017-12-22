class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :room_type
      t.integer :user_id
      t.integer :room_id
      t.date :start_date
      t.date :last_date

      t.timestamps null: false
    end
  end
end
