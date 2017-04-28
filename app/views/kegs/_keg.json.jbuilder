json.extract! keg, :id, :name, :drink_id, :startDate, :endDate, :capacity, :price, :created_at, :updated_at
json.url keg_url(keg, format: :json)