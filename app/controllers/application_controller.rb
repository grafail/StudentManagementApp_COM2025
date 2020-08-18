class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def checkIfAdmin
    redirect_to root_path, notice: 'You do not have permission to view this page!' unless !current_user.nil? and current_user.has_role? :admin
  end

  def checkNotStudent
    redirect_to root_path, notice: 'You do not have permission to view this page!' if current_user.has_role? :student
  end

end
