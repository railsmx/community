class Social
  constructor: (facebook_id) ->
    Socialite.setup
      facebook:
        appId: facebook_id

    Socialite.load ($ '.social-buttons')

App.Utilities.Social = Social
