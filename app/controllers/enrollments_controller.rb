class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]
  before_action :checkNotStudent, only: [:edit, :update, :destroy]

  # GET /enrollments
  # GET /enrollments.json
  def index
    if current_user.has_role? :admin
      @enrollments = Enrollment.all
    elsif current_user.has_role? :student
      @enrollments = Enrollment.with_student(current_user)
    elsif current_user.has_role? :staff
      @enrollments = Enrollment.with_lecturer(current_user)
    end
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/new
  def new
    @enrollment = Enrollment.new
  end

  # GET /enrollments/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    #If user id is not specified in request, enroll current user (useful for javascript)
    if(params[:enrollment]!=nil and params[:enrollment][:user_id]==nil and current_user!=nil)
      params[:enrollment][:user_id]=current_user.id
    end
    @enrollment = Enrollment.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully created.' }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to @enrollment, notice: 'Enrollment was successfully updated.' }
        format.json { render :show, status: :ok, location: @enrollment }
      else
        format.html { render :edit }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enrollment_params
      params.require(:enrollment).permit(:user_id, :subject_id)
    end
end
