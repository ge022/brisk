json.extract! review, :id, :name, :review_text, :rating, :restaurant_id, :created_at, :updated_at
json.url review_url(review, format: :json)
