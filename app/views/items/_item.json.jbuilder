json.extract! item, :id, :title, :list_id, :created_at, :updated_at
json.url list_item_url(item, list_id: item.list_id, format: :json)
