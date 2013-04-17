Rails.application.config.cache_store = :dalli_store,
  ENV["MEMCACHIER_SERVERS"].split(","),
  { username: ENV["MEMCACHIER_USERNAME"],
    password: ENV["MEMCACHIER_PASSWORD"] } if Rails.env.production?
