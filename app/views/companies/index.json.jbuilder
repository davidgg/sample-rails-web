json.array!(@companies) do |company|
  json.extract! company, :id, :email, :name, :location, :desc, :website, :public_email, :logo
  json.url company_url(company, format: :json)
end
