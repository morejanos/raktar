json.array!(@componenttypes) do |componenttype|
  json.extract! componenttype, :id, :name
  json.url componenttype_url(componenttype, format: :json)
end
