module TweetEvent
  class << self
    def update(event, url)
      begin
        Twitter.update("#{event.name} #{url}")
        Rails.logger.debug("Sending Tweet #{event.name} #{url}")
      rescue Exception => ex
        Rails.logger.error("Message error with Twitter: #{ex.message}")
        raise ex if Rails.env.test?
      end
    end
  end
end