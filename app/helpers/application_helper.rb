module ApplicationHelper
  def display_login_link
    unless identity_signed_in?
      link_to "Login", "/auth/github", class: "sign-in btn-info"
    else
      link_to "Logout", signout_path, class: "sign-out btn-info"
    end
  end
end
