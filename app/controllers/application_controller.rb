class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  rescue_from Exception, :with => :error_render_method

  # Checks if a user is an Admin
  def checkIfAdmin
    redirect_to root_path, notice: I18n.t('no_permission') unless !current_user.nil? and current_user.has_role? :admin
  end

  # Checks if a user is a student
  def checkNotStudent
    redirect_to root_path, notice: I18n.t('no_permission') if current_user.has_role? :student
  end

  # Checks if a user is staff
  def checkNotStaff
    redirect_to root_path, notice: I18n.t('no_permission') if current_user.has_role? :staff
  end

  # This is used to handle exceptions in the application controller.
  def error_render_method
    redirect_to root_path, notice: 'An error has occured!'
  end

end
