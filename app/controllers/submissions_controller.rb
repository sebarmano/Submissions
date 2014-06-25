class SubmissionsController < ApplicationController
  before_action :set_assignment
  before_action :set_submission, only: [:edit, :show]

  def index
    @submissions = @assignment.submissions
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = @assignment.submissions.create(submission_params)
    if @submission.save
      redirect_to assignments_path, notice: 'Assignment was successfully submitted for review.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @submission = Submission.find(params[:id])
    @submission.update(submission_update_params)
    redirect_to assignment_submission_path(@assignment, @submission)
  end

  def show
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end

  def set_submission
    @submission = @assignment.submissions.find(params[:id])
  end

  def submission_params
    params.require(:submission).permit(:user_id, :assignment_id, :url)
  end

  def submission_update_params
    params.require(:submission).permit(:user_id, :assignment_id, :url, :complete)
  end
end
