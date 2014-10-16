json.array!(@requests)do |request|
  json.extract! request, :address
  json.title request.dog_name
  json.start request.start_time
  json.end request.end_time
  json.url request_url(request, format: :html)
end
