json.array!(@packagings) do |packaging|
  json.extract! packaging, :id, :name
  json.url packaging_url(packaging, format: :json)
end
