class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    identity = Identity.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Identity.create_with_omniauth(auth)
    session[:identity_id] = identity.id
    redirect_to root_url, :notice => "Signed in!"
  end
  
  def destroy
    session[:identity_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end  
end