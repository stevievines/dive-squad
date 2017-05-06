json.array!(@fundamentals) do |fundamental|
  json.extract! fundamental, :id, :name
  json.url fundamental_url(fundamental, format: :json)
end
