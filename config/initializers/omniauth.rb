Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'f8b0410a919f68884625', '889c996d173e39fd8134c0f9dbd4160eee0a8183'
end
