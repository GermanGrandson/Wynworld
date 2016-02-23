json.array!(@companies) do |company|
  json.extract! company, :id, :name, :city, :state, :description, :website, :hp
  json.url company_url(company, format: :json)
end
