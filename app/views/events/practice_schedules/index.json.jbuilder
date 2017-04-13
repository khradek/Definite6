json.array!(@practice_schedules) do |practice_schedule|
  json.extract! practice_schedule, :id, :title
  json.url practice_schedule_url(practice_schedule, format: :json)
end
