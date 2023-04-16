json.extract! collection_point, :id, :name, :address, :latitude, :longitude, :contact, :website, :created_at, :updated_at
json.url collection_point_url(collection_point, format: :json)
