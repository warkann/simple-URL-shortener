class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def redirect_to_short_link
    short_link = request.env['PATH_INFO'].delete!("/")
    result = Link.find_by_short(short_link)
    
    result ? (redirect_to "#{result.long}") : (redirect_to root_path)
    
  end
end
