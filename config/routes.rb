Community::Application.routes.draw do

# This line mounts Crowdblog's routes at /blog by default.
# This means, any requests to the /blog URL of your application will go to Crowdblog::posts#index.
# If you would like to change where this extension is mounted, simply change the :at option to something different.
#
# We ask that you don't use the :as option here, as Forem relies on it being the default of "crowdblog"
mount Crowdblog::Engine => '/blog'


# This line mounts Crowdblog's routes at /blog by default.
# This means, any requests to the /blog URL of your application will go to Crowdblog::posts#index.
# If you would like to change where this extension is mounted, simply change the :at option to something different.
#
# We ask that you don't use the :as option here, as Forem relies on it being the default of "crowdblog"
mount Crowdblog::Engine, :at => '/blog'

  resources :events, path: '/eventos'

  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", as: :signout

  get "/contacto" => "contact_form#new", as: :contact_form_new
  post "/contacto" => "contact_form#create", as: :contact_form

  get "/:id" => "home#show", as: :static

  if Rails.env.test?
    post '/sessions/create' => 'sessions#create'
  end

  root to: "home#index"

  mount Crowdblog::Engine => '/blog_admin'

end
