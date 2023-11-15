Rails.application.routes.draw do
  resources :restaurants do
    # CUSTOM ROUTES
    # custom index!
    collection do
      # /restaurants/whatever_you_type_below
      get :top
    end

    # custom show
    member do
      # /restaurants/:id/whatever_you_add
      get :chef
    end

    # NESTED ROUTES
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]

  # get '/restaurants/:id/reviews/new', to: 'reviews#new'
  # get '/restaurants/top', to: 'restaurants#top'


end
