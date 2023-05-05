json.extract! news, :id, :news, :team_id, :created_at, :updated_at
json.url news_url(news, format: :json)
