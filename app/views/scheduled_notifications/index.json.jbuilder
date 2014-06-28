json.array!(@scheduled_notifications) do |scheduled_notification|
  json.extract! scheduled_notification, :id, :provider_id, :start_date, :end_date, :ongoing, :frequency, :message_content
  json.url scheduled_notification_url(scheduled_notification, format: :json)
end
