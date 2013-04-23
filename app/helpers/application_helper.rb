module ApplicationHelper
  def display_login_link(&block)
    unless identity_signed_in?
      link_to t('.sign_in'), "/auth/github",
        class: "sign-in zocial github",
        style: "font-size: .8em;"
    else
      html = capture(&block) if block_given?
    end
  end

  def display_login_button(&block)
    unless identity_signed_in?
      link_to t('.sign_in'), "/auth/github", class: "sign-in-btn btn btn-large"
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
    link_to t('.add_event'), new_event_path, class: 'btn' if current_identity
  end

  def display_edit_event_link(event)
    link_to edit_event_path(event), class: "edit", style: "left: 0;" do
      message = t('.edit_event')
      message << " "
      message << content_tag(:div, '', class: "icon-edit")
      message.html_safe
    end if event.identity == current_identity
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

  def localize_long_date(date)
    I18n::localize(date, format: t(:long_date, scope: [:date, :formats]))
  end

  def localize_month(date)
    I18n::localize(date, format: t(:month_name, scope: [:date, :formats]))
  end

  def localize_weekday(date)
    I18n::localize(date, format: t(:day_name, scope: [:date, :formats]))
  end

  def localize_time(date)
    I18n::localize(date, format: t(:short_time, scope: [:time, :formats]))
  end

  def title(page_title)
    content_for(:title) { "rails.mx: #{page_title}" }
  end

     def content_file(name, content = nil, options = {}, &block)
        if content || block_given?
          if block_given?
            options = content if content
            content = capture(&block)
          end
          if content
            options[:flush] ? @view_flow.set(name, content) : @view_flow.append(name, content)
          end
          nil
        else
          @view_flow.get(name).presence
        end
      end

  def field_error(model, field)
    if model.errors[field].any?
      content_tag :span, class: 'error' do
        model.errors[field].first
      end
    end
  end
end