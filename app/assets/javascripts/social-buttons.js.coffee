class Social
  constructor: (facebook_id) ->
    Socialite.load ($ '.social-buttons',
      facebook:
        appId: facebook_id
    )

App.Utilities.Social = Social
