json.extract! game, :id, :starts_at, :ends_at, :title, :description, :address, :created_at, :updated_at
json.url game_url(game, format: :json)
