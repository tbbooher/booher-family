class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :lookup_users

  def lookup_users
    @users = User.all
  end

  def set_xhr_flash
    flash.discard if request.xhr?
  end

  def correct_safari_and_ie_accept_headers
    ajax_request_types = ['text/javascript', 'application/json', 'text/xml']
    request.accepts.sort! { |x, y| ajax_request_types.include?(y.to_s) ? 1 : -1 } if request.xhr?
  end

end
