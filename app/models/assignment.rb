class Assignment < ActiveRecord::Base
  validates :title, :description, :date, :due, presence: true
  validate :assign_it_before_it_is_due

  has_many :submissions

  def assign_it_before_it_is_due
    if date >= due
      errors.add(:assign_it_before_it_is_due, ", the assignment can't be due before it is assigned!")
    end
  end


  # def complete?(student)
  #   a =
  #   a && a.completed == true
  # end
  #
  # def for_review?(student)
  #   a = submission(student)
  #   a && a.completed == false
  # end
  #
  # def incomplete?(student)
  #   submission(student) == nil
  # end

  def get_submission(student)
    self.submissions.find_by_user_id(student.id)
  end
end
