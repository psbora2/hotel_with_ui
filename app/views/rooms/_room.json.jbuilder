json.extract! room, :id, :price, :rno, :room_type, :created_at, :updated_at
json.url room_url(room, format: :json)
