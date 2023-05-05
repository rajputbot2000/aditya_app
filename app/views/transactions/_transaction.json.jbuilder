json.extract! transaction, :id, :transfer_amount, :transfer_to, :user_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
