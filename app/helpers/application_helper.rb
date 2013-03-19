module ApplicationHelper
  def display_login_link(&block)
    unless identity_signed_in?
      link_to t('.sign_in'), "/auth/github", class: "sign-in btn-info"
    else
      html = capture(&block) if block_given?
    end
  end

  def display_warden_message_tag
  	content_tag :div, class: 'alert' do
  		warden.message   		
  	end if warden.message.present? 	
  end
end
