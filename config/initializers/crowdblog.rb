Crowdblog.user_class = 'Identity'

Rails.application.config.discus_key = '434324234'
Rails.application.config.publishers = 'guillermo.moreno@crowdint.com'

Crowdblog::PostsController.class_eval do
  layout 'application'

  before_action :current_events
end