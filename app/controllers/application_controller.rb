class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :lookup_users

  def lookup_users
    @users = User.all
  end
end
