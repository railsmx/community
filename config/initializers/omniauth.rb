Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider :github, "95cc6dbd58b0906ae42a", "21aeab7e509252f09417a10693d86e92a5d65cdc"
end
