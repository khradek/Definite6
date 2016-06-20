json.array!(@plays) do |play|
  json.extract! play, :id, :piece1, :event_id, :user_id
  json.url play_url(play, format: :json)
end
