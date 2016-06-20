json.array!(@saved_plays) do |saved_play|
  json.extract! saved_play, :id, :title, :user_id
  json.url saved_play_url(saved_play, format: :json)
end
