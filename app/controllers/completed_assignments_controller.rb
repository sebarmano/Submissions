class CompletedAssignmentsController < ApplicationController
  before_action :set_completed_assignment, only: [:show, :edit, :update, :destroy]
  before_action :require_login


  # GET /completed_assignments
  # GET /completed_assignments.json
  def index
    @completed_assignments = CompletedAssignment.all
  end

  # GET /completed_assignments/1
  # GET /completed_assignments/1.json
  def show
  end

  # GET /completed_assignments/new
  def new
    @completed_assignment = CompletedAssignment.new
  end

  # GET /completed_assignments/1/edit
  def edit
  end

  # POST /completed_assignments
  # POST /completed_assignments.json
  def create
    @completed_assignment = CompletedAssignment.new(completed_assignment_params)

    respond_to do |format|
      if @completed_assignment.save
        format.html { redirect_to assignments_path, notice: 'Completed assignment was successfully created.' }
        format.json { render :show, status: :created, location: @completed_assignment }
      else
        format.html { render :new }
        format.json { render json: @completed_assignment.errors, status: :unprocessable_entity }
      end
    end
    @completed_assignment.update(completed: false)
  end

  # PATCH/PUT /completed_assignments/1
  # PATCH/PUT /completed_assignments/1.json
  def update
    respond_to do |format|
      if @completed_assignment.update(completed_assignment_edit_params)
        format.html { redirect_to assignments_path, notice: 'Completed assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @completed_assignment }
      else
        format.html { render :edit }
        format.json { render json: @completed_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /completed_assignments/1
  # DELETE /completed_assignments/1.json
  def destroy
    @completed_assignment.destroy
    respond_to do |format|
      format.html { redirect_to completed_assignments_url, notice: 'Completed assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_completed_assignment
      @completed_assignment = CompletedAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def completed_assignment_params
      params.require(:completed_assignment).permit(:user_id, :assignments_id, :url)
    end

    def completed_assignment_edit_params
      params.require(:completed_assignment).permit(:user_id, :assignments_id, :url, :completed)
    end
end
