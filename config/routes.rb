Community::Application.routes.draw do
  mount Crowdblog::Engine => '/blog', as: :crowdblog

  get '/blog/:year/:month/:day/:id(.:format)', to: 'crowdblog/posts#show', as: 'post',
    constraints: { year: /\d+/ }

  resources :events, path: '/eventos'

  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", as: :signout

  get "/contacto" => "contact_form#new", as: :contact_form_new
  post "/contacto" => "contact_form#create", as: :contact_form


  get "/blog.(:format)" => 'feeds#show'

  get "/:id" => "home#show", as: :static

  if Rails.env.test?
    post '/sessions/create' => 'sessions#create'
  end

  root to: "home#index"

  if Rails.env.production?
    get '*unmatched_route', :to => 'application#raise_not_found!'
  end
end