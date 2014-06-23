class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  helper_method :current_user, :teacher?, :student?, :status,    :student_completed, :student_for_review

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def teacher?
    User.find(session[:user_id]).teacher_id == 1
  end

  def student?
    !teacher?
  end

  def verify_teacher
    if student?
      redirect_to assignment_path, notice: "You must be a teacher to edit assignments"
    end
  end

  def require_login
    if !session[:user_id]
      redirect_to root_path, notice: "Please sign up or login"
    end
  end

  def completed?(assignment)
    CompletedAssignment.where(user_id: session[:user_id], assignments_id: assignment.id, completed: true).any?
  end

  def for_review?(assignment)
    CompletedAssignment.where(user_id: session[:user_id], assignments_id: assignment.id, completed: false).any?
  end

  def status(assignment)
    if completed?(assignment)
      return "Completed"
    elsif for_review?(assignment)
      return "Up for review"
    else
      return "Incomplete"
    end
  end

  def student_completed(student_id, assignment_id)
    CompletedAssignment.where(user_id: student_id, assignments_id: assignment_id, completed: true)
  end

  def student_for_review(student_id, assignment_id)
    CompletedAssignment.where(user_id: student_id, assignments_id: assignment_id, completed: false)
  end

  # def student_status(student_id, assignment_id)
  #   if student_completed?(student_id, assignment_id)
  #     return "Completed"
  #   elsif student_for_review?(student_id, assignment_id)
  #     return "Up for review"
  #   else
  #     return "Incomplete"
  #   end
  # end

end
