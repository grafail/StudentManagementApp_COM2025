class AdminController < ApplicationController
  before_action :checkIfAdmin, except: [:user]

  # Index page for users
  def index
    @users = User.all
    @editStatus = 'true'
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # Get info for a certain user
  def user
    @user = User.find_by_id(params[:id])
    if @user.has_role? :staff or(current_user.has_role? :student and current_user.id == @user.id) or
        current_user.has_role? :admin or current_user.has_role? :staff
      respond_to do |format|
        format.html { render :user }
        format.json { render json: @user, content_type: 'application/json' }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: I18n.t('no_permission') unless !current_user.nil? and current_user.has_role? :admin }
        format.json { render json: @user, content_type: 'application/json' }
      end
    end
  end

  # Get role of a certain user
  def role
    @user = User.find_by_id(params[:id])
    userRole = @user.roles_name[0]
    if @user.has_role? :staff or(current_user.has_role? :student and current_user.id == @user.id) or
        current_user.has_role? :admin or current_user.has_role? :staff
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: userRole.to_json, content_type: 'application/json' }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: I18n.t('no_permission')}
        format.json { render json: userRole, content_type: 'application/json' }
      end
    end
  end

end
