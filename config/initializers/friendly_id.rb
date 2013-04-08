FriendlyId.defaults do |config|
  config.use :slugged, :reserved
  config.base = :name
end