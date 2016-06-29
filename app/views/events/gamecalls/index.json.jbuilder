json.array!(@gamecalls) do |gamecall|
  json.extract! gamecall, :id, :title, :gdata, :event_id, :user_id, :start_time, :end_time
  json.url gamecall_url(gamecall, format: :json)
end
