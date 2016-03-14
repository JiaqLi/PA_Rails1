json.array!(@users) do |user|
  json.extract! user, :id, :name, :pwd
  json.url user_url(user, format: :json)
end
