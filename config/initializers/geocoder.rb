Geocoder.configure({
  lookup: :google,
  key: ENV['GOOGLE_API_KEY'],
  cache: Rails.cache,
})
