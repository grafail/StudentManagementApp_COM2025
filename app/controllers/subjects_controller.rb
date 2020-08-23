class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :checkNotStudent, except: [:index, :show, :destroy]
  before_action :checkIfAdmin, only: [:destroy]

  # GET /subjects
  # GET /subjects.json
  def index
    # Index shows different content according to the user who views it
    @editStatus = 'true'
    if current_user.has_role? :admin
      @subjects = Subject.all
    elsif current_user.has_role? :staff
      @subjects = Subject.with_lecturer(current_user)
    elsif current_user.has_role? :student
      @subjects = Subject.student_can_enroll(current_user)
      @editStatus = 'false'
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    respond_to do |format|
      format.html { redirect_to subjects_url}
      format.json { render :show, status: :ok, location: @subject }
    end
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_url, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { redirect_to subjects_url }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if (current_user.has_role?(:admin) or current_user.has_role?(:staff)) and @subject.update(subject_params)
        format.html { redirect_to subjects_url, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { redirect_to subjects_url, notice: 'Subject was not successfully updated.' }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @subject = Subject.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subject_params
    params.require(:subject).permit(:course_id, :user_id, :title, :description)
  end
end
