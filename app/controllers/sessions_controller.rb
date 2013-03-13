class SessionsController < ApplicationController
  def create
    warden.authenticate!(scope: :identity)
    redirect_to root_url, :notice => "Signed in!"
  end
  
  def destroy
    #session[:identity_id] = nil
    warden.logout(:identity)
    redirect_to root_url, :notice => "Signed out!"
  end  
end