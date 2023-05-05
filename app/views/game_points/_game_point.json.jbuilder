json.extract! game_point, :id, :title, :img, :link, :created_at, :updated_at
json.url game_point_url(game_point, format: :json)
