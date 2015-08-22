json.array!(@products) do |product|
  json.extract! product, :id, :image, :description, :price, :organization_id
  json.url product_url(product, format: :json)
end
