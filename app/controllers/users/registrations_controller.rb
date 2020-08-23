# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, :checkIfAdmin, only: [:new, :create, :deleteUser, :update_info]
  skip_before_action :require_no_authentication
  before_action :configure_sign_up_params
  before_action :configure_account_update_params

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # Deletes a user
  def deleteUser
    User.delete(params[:id])
  end


  # Creates a user
  def create
    userParameters = params[:user]
    @user = User.new(sign_up_params.except!('roles'))
    puts 'test'
    respond_to do |format|
      if @user.save
        @user.grant userParameters[:roles] unless (userParameters[:roles].nil?)
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created }
      else
        format.html { redirect_to root_path, notice: 'User was not successfully created.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates user info
  def update_info
    @user = User.find(params[:id])
    userParameters = params[:user]
    respond_to do |format|
      if @user.update(account_update_params.except!('roles'))
        @user.grant userParameters[:roles] unless (userParameters[:roles].nil?)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render json: @user, status: :ok }
      else
        format.html { render root_path, notice: 'User was not successfully updated.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :roles, :course_id])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :roles, :course_id])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def update_resource(resource, params)
    if (params[:password].nil?)
      resource.update_without_password(params)
    else
      super
    end
  end

end
