module TweetEvent
  included do
    def update(event = {}, url)
      Twitter.update("#{event[:name]} #{url}")
    end
  end
end