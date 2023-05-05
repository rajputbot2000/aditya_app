json.extract! reward, :id, :payout_name, :payout_logo, :payout_type, :payout_amount, :coin_value, :created_at, :updated_at
json.url reward_url(reward, format: :json)
