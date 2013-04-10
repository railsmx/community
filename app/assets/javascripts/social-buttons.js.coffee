class Social
  constructor: ->
    Socialite.load ($ '.social-buttons',
      facebook:
        appId: '498001033582275'
    )

App.Utilities.Social = Social
