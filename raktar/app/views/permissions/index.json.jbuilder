json.array!(@permissions) do |permission|
  json.extract! permission, :id, :name
  json.url permission_url(permission, format: :json)
end
