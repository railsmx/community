Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :omniauth_public
  manager.failure_app = lambda { |env| DashboardController.actions(:index).call(env) }
end
 
Warden::Manager.serialize_into_session(:identity) do |identity|
  identity.id
end
 
Warden::Manager.serialize_from_session(:identity) do |id|
  Identity.find(id)
end
 
Warden::Strategies.add(:omniauth_public) do
  def valid?
    controller_name = request.env['action_dispatch.request.parameters']['controller']
    controller_name == 'sessions'
  end
 
  def authenticate!
    auth = request.env['omniauth.auth']
    if valid?
      identity = Identity.my_identity(auth['uid'], auth['provider']).last || Identity.create_with_omniauth(auth)
      success! identity
    else
      fail! I18n.t('warden.strategies.unauthorized_domain')
    end
  end

 
  def create_identity(auth)
    params = { uid: auth['uid'], provider: auth['provider'],
               username: auth['info']['nickname'], email: auth['info']['email'] }
    Identity.create! params
  end
end