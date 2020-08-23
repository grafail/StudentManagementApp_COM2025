module ApplicationHelper

  # Used to generate user form
  def resource_name
    :user
  end

  # Used to generate user form
  def resource
    @user ||= User.new
  end

  # Used to generate user form
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
