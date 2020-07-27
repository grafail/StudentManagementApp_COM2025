class AdminController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def user
    @user = User.find_by_id(params[:id])
    respond_to do |format|
      format.json { render json:@user, content_type: 'application/json'}
    end
  end

  def show

  end
end
