json.array!(@scripts) do |script|
  json.extract! script, :id, :title, :sdata, :event_id, :user_id
  json.url script_url(script, format: :json)
end
