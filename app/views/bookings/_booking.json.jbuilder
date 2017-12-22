json.extract! booking, :id, :room_type, :user_id, :room_id, :start_date, :last_date, :created_at, :updated_at
json.url booking_url(booking, format: :json)
