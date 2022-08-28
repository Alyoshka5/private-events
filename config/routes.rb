Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :events
  resources :users, only: :show
  # Defines the root path route ("/")
  root "events#index"
  get "events/:id/add_attendee" => "events#add_attendee", as: :events_add_attendee
  get "events/:id/remove_attendee" => "events#remove_attendee", as: :events_remove_attendee
end
