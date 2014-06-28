json.array!(@providers) do |provider|
  json.extract! provider, :id, :token, :social_data
  json.url provider_url(provider, format: :json)
end
