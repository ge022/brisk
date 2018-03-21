Rails.application.routes.draw do
  resources :comments

  resources :blogs do
    resources :comments
  end

  resources :product_reviews

  resources :articles

  get 'email_article/:id',
      to: 'articles#article_email',
      as: 'email_article'

  resources :puzzles

  devise_for :users

  # Edit User
  devise_scope :user do
    get 'preferences',
        to: 'devise/registrations#edit',
        as: 'preferences'
  end

  resources :reviews

  resources :products do
    resources :product_reviews
  end

  resources :restaurants do
    get 'page/:page', action: :index, on: :collection
    resources :reviews
  end

  get 'email_restaurant/:id',
      to: 'restaurants#email_restaurant',
      as: 'email_restaurant'

  post '/puzzles/new',
       to: 'puzzles#create'

  get 'maps',
      to: 'page#maps',
      as: 'maps'

  # get 'page/articles'
  get 'articles',
      to: 'page#articles',
      as: 'articles_url'

  get 'restaurants',
      to: 'page#restaurants',
      as: 'restaurants_url'

  get 'products',
      to: 'page#products',
      as: 'products_url'

  get 'store',
      to: 'store#index',
      as: 'store'

  get 'store/:id',
      to: 'store#show',
      as: 'store_show'


  get 'calendar((/:month)/:year)',
      to: 'page#calendar',
      as: 'calendar'

  get 'contact_us',
      to: 'page#contact_us',
      as: 'contact_us'

  get 'login',
      to: 'page#login',
      as: 'login'

  root 'page#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
