json.extract! applist, :id, :title, :logo, :app_link, :redeem_type, :bonus, :minimum_withdrawl, :referral_code, :created_at, :updated_at
json.url applist_url(applist, format: :json)
