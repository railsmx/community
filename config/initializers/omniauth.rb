Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '63e748f8fe4931608503', '308f12f4d1c3bc18cfdbf11d047e525ca76ec5bd'
end