json.array!(@scheduled_groups) do |scheduled_group|
  json.extract! scheduled_group, :id, :schedule_id
  json.url scheduled_group_url(scheduled_group, format: :json)
end
