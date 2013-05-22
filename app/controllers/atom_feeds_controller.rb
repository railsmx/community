class AtomFeedsController < ApplicationController
  def show
    posts = Crowdblog::Post.all_for_feed
    events = Event.limit(15)
    @items = (posts + events).sort_by(&:updated_at).reverse
  end
end