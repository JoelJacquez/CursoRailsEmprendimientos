json.array!(@entrepreneurs) do |entrepreneur|
  json.extract! entrepreneur, :id, :title, :description
  json.url entrepreneur_url(entrepreneur, format: :json)
end
