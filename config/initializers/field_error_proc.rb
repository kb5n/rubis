# set default error class
Rails.application.config.action_view.field_error_proc = proc { |html_tag, _instance|
  ActionController::Base.helpers.content_tag(:div, html_tag, class: 'has-error')
}
