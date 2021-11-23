class AssessmentsController < ApplicationController
  before_action :set_assessment, only: %i[ show edit update destroy ]

  # GET /assessments or /assessments.json
  def index
    @assessments = Assessment.all
  end

  # GET /assessments/1 or /assessments/1.json
  def show
  end

  # GET /assessments/new
  def new
    @assessment = Assessment.new
  end

  # GET /assessments/1/edit
  def edit
  end

  # POST /assessments or /assessments.json
  def create
    @assessment = Assessment.new(assessment_params)

    respond_to do |format|
      if @assessment.save
        format.html { redirect_to @assessment, notice: "Assessment was successfully created." }
        format.json { render :show, status: :created, location: @assessment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessments/1 or /assessments/1.json
  def update
    respond_to do |format|
      if @assessment.update(assessment_params)
        format.html { redirect_to @assessment, notice: "Assessment was successfully updated." }
        format.json { render :show, status: :ok, location: @assessment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessments/1 or /assessments/1.json
  def destroy
    @assessment.destroy
    respond_to do |format|
      format.html { redirect_to assessments_url, notice: "Assessment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def my_assessments
    @assessments = current_user.assigned_assessments
  end

  def new_assignment
    assessment = Assessment.find params[:assessment_id]
    user_ids = params[:assignments].keys.map {|i| !i.include?("_") ? i : nil}.compact
    users = User.where(id: user_ids)
    
    users.each do |user|
      if params[:assignments][:"#{user.id}_assign"] == "1"
        AssignedAssessment.create({ assessment_id: assessment.id, user_id: user.id })
      end
    end

    redirect_to request.referrer + "#assignments"
  end

  def remove_assignment
    assessment = Assessment.find params[:assessment_id]
    user_ids = params[:assignments].keys.map {|i| !i.include?("_") ? i : nil}.compact
    assignments = AssignedAssessment.where(assessment_id: assessment.id, user_id: user_ids)
    
    assignments.each do |a| 
      a.destroy if params[:assignments][:"#{a.user_id}_assign"] == "1"
    end

    redirect_to request.referrer + "#assignments"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment
      @assessment = Assessment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assessment_params
      params.require(:assessment).permit(:name, :desc, :active, :created_by_id, questions_attributes: [:id, :question, :assessment_id, :caption, :option_type])
    end
end
