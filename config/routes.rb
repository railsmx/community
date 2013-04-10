Community::Application.routes.draw do
  resources :events, :path => '/eventos'

  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout

  get "/contacto" => "contact_form#new", as: :contact_form_new
  post "/contacto" => "contact_form#create", as: :contact_form

  get "/privacidad" => "home#show"
  get "/acerca" => "home#show"

  if Rails.env.test?
    post '/sessions/create' => 'sessions#create'
  end

  root to: "home#index"

end
