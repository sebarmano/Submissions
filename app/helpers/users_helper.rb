module UsersHelper
  def teachers
    User.where(teacher_id != nil)
  end
end
