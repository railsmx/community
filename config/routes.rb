Community::Application.routes.draw do
  #resources :events

  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout

  get "/contacto" => "contact_form#new", as: :contact_form_new
  post "/contacto" => "contact_form#create", as: :contact_form

  get "/privacidad" => "home#privacy"
  get "/acerca" => "home#about"

  get "/eventos" => "events#index", as: :events
  get "/eventos/:id" => "events#show", as: :event
  get "/eventos/new" => "events#new", as: :new_event
  get "/eventos/:id/edit" => "events#edit", as: :edit_event
  post "/eventos" => "events#create"
  patch "/eventos/:id" => "events#update"
  put "/eventos/:id" => "events#update"
  delete "/eventos/:id" => "events#destroy"

  get "/:id" => "home#show", as: :static

  if Rails.env.test?
    post '/sessions/create' => 'sessions#create'
  end

  root to: "home#index"

end
