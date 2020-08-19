class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  before_action :checkNotStudent, except: [:index, :show]

  # GET /grades
  # GET /grades.json
  def index
    @editStatus = 'true'
    if current_user.has_role? :admin
      @grades = Grade.all
    elsif current_user.has_role? :student
      @grades = Grade.with_student(current_user)
      @editStatus = 'false'
    elsif current_user.has_role? :staff
      @grades = Grade.with_lecturer(current_user)
    end
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
    if (current_user.has_role? :student and current_user.id == @grade.user.id) or (current_user.has_role? :staff and
        Grade.with_lecturer(current_user).includes(@grade)) or current_user.has_role? :admin
      respond_to do |format|
        format.html { redirect_to grades_url}
        format.json { render :show, status: :ok, location: @grade }
      end
    else
      redirect_to root_path, notice: 'You do not have permission to view this page!'
    end
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to grades_url, notice: 'Grade was successfully created.' }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { redirect_to grades_url }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to grades_url, notice: 'Grade was successfully updated.', status: :ok }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { redirect_to grades_url }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_grade
    @grade = Grade.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def grade_params
    params.require(:grade).permit(:assessment_id, :user_id, :grade)
  end
end
