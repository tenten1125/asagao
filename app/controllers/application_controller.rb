class ApplicationController < ActionController::Base
  helper_method :current_member

  private

  def current_member
    Member.find_by(id: session[:member_id]) if session[:member_id]
  end
end
