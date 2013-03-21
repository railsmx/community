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

  def display_invalid_event_message
    content_tag :div, class: 'alert' do
      t('.invalid_event')
    end if flash[:alert]
  end

  def display_event_created_message
    content_tag :div, class: 'notice' do
      t('.create_event')
    end if flash[:notice]
  end
end
