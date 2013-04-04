class Social
  constructor: ->
    Socialite.load ($ '.social-buttons')

App.Utilities.Social = Social