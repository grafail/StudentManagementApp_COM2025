class AssessmentsController < ApplicationController
  before_action :set_assessment, only: [:show, :edit, :update, :destroy]
  before_action :checkNotStudent, except: [:index, :show]

  # GET /assessments
  # GET /assessments.json
  def index
    # Index shows different content according to the user who views it
    if current_user.has_role? :admin
      @editStatus = 'true'
      @assessments = Assessment.all
    elsif current_user.has_role? :student
      @editStatus = 'false'
      @assessments = Assessment.with_student(current_user)
    elsif current_user.has_role? :staff
      @editStatus = 'true'
      @assessments = Assessment.with_lecturer(current_user)
    end
  end

  # GET /assessments/1
  # GET /assessments/1.json
  def show
    # Index shows different content according to the user who views it
    respond_to do |format|
        format.html { redirect_to assessments_url}
        format.json {
          if current_user.has_role? :admin
            render :show, status: :ok, location: @assessment
          elsif current_user.has_role? :student
            render :show, status: :ok, location: @assessment if Assessment.with_student(current_user).include?(@assessment)
          elsif current_user.has_role? :staff
            render :show, status: :ok, location: @assessment if Assessment.with_lecturer(current_user).include?(@assessment)
          end
        }
    end
  end

  # POST /assessments
  # POST /assessments.json
  def create
    @assessment = Assessment.new(assessment_params)

    respond_to do |format|
      if @assessment.save
        format.html { redirect_to assessments_url, notice: 'Assessment was successfully created.' }
        format.json { render :show, status: :created, location: @assessment }
      else
        format.html { redirect_to assessments_url }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessments/1
  # PATCH/PUT /assessments/1.json
  def update
    respond_to do |format|
      if @assessment.update(assessment_params)
        format.html { redirect_to assessments_url, notice: 'Assessment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assessment }
      else
        format.html { redirect_to assessments_url }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessments/1
  # DELETE /assessments/1.json
  def destroy
    @assessment.destroy
    respond_to do |format|
      format.html { redirect_to assessments_url, notice: 'Assessment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_assessment
    @assessment = Assessment.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def assessment_params
    params.require(:assessment).permit(:subject_id, :name)
  end
end
