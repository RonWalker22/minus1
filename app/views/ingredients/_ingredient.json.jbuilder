json.extract! ingredient, :id, :name, :recipe_id, :private, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
