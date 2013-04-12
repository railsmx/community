module TweetEvent
  extend self

  def update(event = {}, url)
    begin
      Twitter.update("#{event[:name]} #{url}/#{event[:id]}")
      Rails.logger.debug("Sending Tweet #{event[:name]} #{url}/#{event[:id]}")
    rescue Exception => exc
      Rails.logger.debug("Message error with Twitter: #{exc.message}")
    end
  end
end