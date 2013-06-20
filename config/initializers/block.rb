Rails.application.config.middleware.use Rack::Block do
  block ENV['BLOCK'].try(:split, ',') if ENV['BLOCK'].present?
end
