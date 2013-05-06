class Crowdblog::PostsController < ApplicationController
  layout 'application'
  before_action :current_events
  before_action :current_posts

  def index
    @posts = Crowdblog::Post.published_and_ordered
    @history = Crowdblog::Post.for_history - @posts
  end

  def show
    @post = Crowdblog::Post.find_by_permalink(params[:id])
    unless @post
      @post = Crowdblog::Post.find(params[:id])
      @post.published_at = Date.today
    end
    @history = Crowdblog::Post.for_history - [@post]
  end
end