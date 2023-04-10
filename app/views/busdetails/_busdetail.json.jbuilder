json.extract! busdetail, :id, :bus_name, :bus_no, :total_seats, :available_seats, :start_time, :end_time, :created_at, :updated_at
json.url busdetail_url(busdetail, format: :json)
