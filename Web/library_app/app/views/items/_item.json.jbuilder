json.extract! item, :id, :title, :ISBN, :Description, :created_at, :updated_at
json.url item_url(item, format: :json)
