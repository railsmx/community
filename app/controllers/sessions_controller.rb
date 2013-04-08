class SessionsController < ApplicationController
  def create
    warden.authenticate!(scope: :identity)
    redirect_to root_url
  end

  def destroy
    warden.logout(:identity)
    redirect_to root_url
  end
end
