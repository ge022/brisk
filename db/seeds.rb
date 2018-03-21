# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

include Faker

# Restaurant.destroy_all
#
# 15.times do
#   restaurant = Restaurant.create(
#       name: Company.name,
#       location: Address.city,
#       cuisine: Food.dish,
#       low_price_range: Number.decimal(2, 2),
#       high_price_range: Number.decimal(2, 2),
#       tags: Company.catch_phrase,
#       image: LoremPixel.image("#{rand(50..100)}x#{rand(50..100)}")
#   )
#   rand(1..10).times do
#     restaurant.reviews.create(
#         name: Name.first_name,
#         review_text: Lorem.paragraph,
#         rating: rand(1..5)
#     )
#   end
#   puts restaurant.inspect
# end

# Product.destroy_all
#
# 15.times do
#   product = Product.create(
#       name: Food.spice,
#       description: Lorem.sentence,
#       quantity_on_hand: rand(0..55),
#       selling_price: Number.decimal(3, 2),
#       cost_of_product: Number.decimal(2, 2),
#       shipping_weight: Number.decimal(2, 2),
#       image_thumbnail: LoremPixel.image("#{rand(150..300)}x#{rand(150..300)}", false, 'food'),
#       image_full: LoremPixel.image("#{rand(700..1500)}x#{rand(700..1500)}", false, 'food')
#   )
#
#   rand(1..10).times do
#     product.product_reviews.create(
#         author: Name.first_name,
#         comment: Lorem.paragraph,
#         rating: rand(1..10)
#     )
#   end
#
# end


#
# Article.destroy_all
# 100.times do
#   article = Article.create(
#       title: Lorem.sentence,
#       author: Name.name,
#       published_date: DateTime.now,
#       published: true,
#       content: Lorem.sentence(45),
#       avatar_thumbnail: LoremPixel.image("100x100", false, 'food'),
#   )
# end

Blog.destroy_all

15.times do
  post = Blog.create(
      title: Lorem.sentence,
      author: Name.name,
      content: Lorem.paragraph(5),
      published_date: DateTime.now
  )

  rand(1..5).times do
    name = Name.first_name
    post.comments.create(
        author: name,
        content: Lorem.paragraph,
        rating: rand(1..5),
        avatar: Avatar.image("#{name}", '25x25')
    )
  end

end
