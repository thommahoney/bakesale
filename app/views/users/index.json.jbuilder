json.array!(@users) do |user|
  json.extract! user, :id, :full_name, :phone, :digits_id, :digits_access_token, :digits_access_secret, :email
  json.url user_url(user, format: :json)
end
