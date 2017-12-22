class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :price
      t.string :rno
      t.integer :room_type

      t.timestamps null: false
    end
  end
end
