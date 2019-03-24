class ApplicationController < ActionController::Base
  http_basic_authenticate_with :name => 'admin', :password => 'hogehoge' if Rails.env == "production"



  #production or development
  #上記BASIC認証の作成
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
