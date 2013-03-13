class SessionsController < ApplicationController
  def create
    warden.authenticate!
    # auth = request.env["omniauth.auth"]
    # identity = Identity.find_by_provider_and_uid(auth["provider"], auth["uid"]) || Identity.create_with_omniauth(auth)
    # #session[:identity_id] = identity.id
    # warden.set_
    redirect_to root_url, :notice => "User: #{current_identity.inspect}"
  end
  
  def destroy
    #session[:identity_id] = nil
    warden.logout
    redirect_to root_url, :notice => "Signed out!"
  end  
end