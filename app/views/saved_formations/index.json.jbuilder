json.array!(@saved_formations) do |saved_formation|
  json.extract! saved_formation, :id, :title, :user_id
  json.url saved_formation_url(saved_formation, format: :json)
end
