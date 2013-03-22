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

  def display_create_event_link
    link_to t('.add_event'), new_event_path if current_identity
  end

  def display_edit_event_link(event)
    link_to t('.edit'), edit_event_path(event), :class => 'edit' if event.identity == current_identity
  end

  def display_alert
    content_tag :div, class: 'alert' do
      flash[:alert]
    end if flash[:alert]
  end

  def display_notice
    content_tag :div, class: 'notice' do
      flash[:notice]
    end if flash[:notice]
  end
end
