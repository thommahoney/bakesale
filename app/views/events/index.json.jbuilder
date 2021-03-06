json.array!(@events) do |event|
  json.extract! event, :id, :start_at, :end_at, :name, :organization_id
  json.url event_url(event, format: :json)
end
