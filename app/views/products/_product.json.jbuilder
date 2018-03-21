json.extract! product, :id, :name, :description, :quantity_on_hand, :selling_price, :cost_of_product, :shipping_weight, :image_thumbnail, :image_full, :created_at, :updated_at
json.url product_url(product, format: :json)
