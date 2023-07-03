# frozen_string_literal: true

Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home", as: 'home'

  # Show Events 
  get '/events', to: 'event_admin#index', as: 'events'
  # Create Event
  get '/events/new', to: 'event_admin#new', as: 'new_event'
  post '/events', to: 'event_admin#create'

  #Edit Event
  get '/events/:id/edit', to: 'event_admin#edit', as: 'edit_event'
  patch '/events/:id', to: 'event_admin#update', as: 'update_event'

  #Delete Event
  get '/events/:id', to: 'event_admin#destroy'
  delete '/events/:id', to: 'event_admin#destroy', as: 'delete'

  

end
