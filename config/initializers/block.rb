Rails.application.config.middleware.use Rack::Block do
  bot_access do
    path '/posts/fut11com-busca-desarrollador*' do
      halt 302
    end
  end
end
