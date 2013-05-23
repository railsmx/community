class FeedsController < ApplicationController
  def show

    posts = Rails.cache.fetch('posts', expires_in: 12.hours) do
      Crowdblog::Post.all_for_feed
    end

    events = Rails.cache.fetch('events', expires_in: 12.hours) do
      Event.limit(15)
    end

    @items = (posts + events).sort_by(&:updated_at).reverse

    respond_to do | format |
      format.xml { render layout: false }
      format.rss { render layout: false }
    end
  end
end