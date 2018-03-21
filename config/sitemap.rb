# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://127.0.0.1:3000/"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #

  # Restaurants
  add restaurants_url_path

  Restaurant.find_each do |restaurant|
    add restaurant_path(restaurant), :lastmod => restaurant.updated_at
  end

  # Store
  add store_path

  Product.find_each do |product|
    add store_show_path(product), :lastmod => product.updated_at
  end

  # Blog
  add blogs_path

  Blog.find_each do |blog|
    add blog_path(blog), :lastmod => blog.updated_at
  end

  # Articles
  add articles_url_path

  Article.find_each do |article|
    add article_path(article), :lastmod => article.updated_at
  end

  # Calendar
  add calendar_path

  # Contact
  add contact_us_path

  # Puzzle
  add puzzles_path

  # Login
  add login_path

  # Register
  add new_user_registration_path

end
