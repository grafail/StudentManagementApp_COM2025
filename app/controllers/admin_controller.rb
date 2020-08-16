class AdminController < ApplicationController
  before_action :checkIfAdmin, except: [:user]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def user
    @user = User.find_by_id(params[:id])
    if (current_user.has_role? :student and current_user.id == @user.id) or current_user.has_role? :admin or current_user.has_role? :staff
      respond_to do |format|
        format.html { render :user }
        format.json { render json: @user, content_type: 'application/json' }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'You do not have permission to view this page!' unless current_user.has_role? :admin }
        format.json { render json: @user, content_type: 'application/json' }
      end
    end
  end

end
