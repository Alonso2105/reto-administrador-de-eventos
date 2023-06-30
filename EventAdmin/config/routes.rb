Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/home', to: 'pages#home'
  get '/events', to: 'event_admin#index', as: 'events'
  get '/events/:id', to: 'event_admin#destroy'
end
