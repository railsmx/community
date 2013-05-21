class AtomFeedsController < ApplicationController
  def show
    @posts = Crowdblog::Post.all
  end
end