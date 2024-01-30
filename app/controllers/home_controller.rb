class HomeController < ApplicationController
  def index
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
