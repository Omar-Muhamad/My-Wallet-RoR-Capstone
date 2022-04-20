json.extract! category_transaction, :id, :category_id, :transaction_id, :created_at, :updated_at
json.url category_transaction_url(category_transaction, format: :json)
