class AssesmentsController < ApplicationController
  before_action :set_assesment, only: [:show, :edit, :update, :destroy]

  # GET /assesments
  # GET /assesments.json
  def index
    @assesments = Assesment.all
  end

  # GET /assesments/1
  # GET /assesments/1.json
  def show
  end

  # GET /assesments/new
  def new
    @assesment = Assesment.new
  end

  # GET /assesments/1/edit
  def edit
  end

  # POST /assesments
  # POST /assesments.json
  def create
    @assesment = Assesment.new(assesment_params)

    respond_to do |format|
      if @assesment.save
        format.html { redirect_to @assesment, notice: 'Assesment was successfully created.' }
        format.json { render :show, status: :created, location: @assesment }
      else
        format.html { render :new }
        format.json { render json: @assesment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assesments/1
  # PATCH/PUT /assesments/1.json
  def update
    respond_to do |format|
      if @assesment.update(assesment_params)
        format.html { redirect_to @assesment, notice: 'Assesment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assesment }
      else
        format.html { render :edit }
        format.json { render json: @assesment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assesments/1
  # DELETE /assesments/1.json
  def destroy
    @assesment.destroy
    respond_to do |format|
      format.html { redirect_to assesments_url, notice: 'Assesment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assesment
      @assesment = Assesment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assesment_params
      params.require(:assesment).permit(:subject_id, :name)
    end
end
