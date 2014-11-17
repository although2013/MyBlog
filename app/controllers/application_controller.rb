class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protect_from_forgery with: :exception
  include ApplicationHelper
  include SessionsHelper
  include MicropostsHelper
  include NotificationsHelper
  include UsersHelper
end
