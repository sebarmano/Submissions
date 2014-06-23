class Assignment < ActiveRecord::Base
  validates :title, :description, :date, :due, presence: true
  validate :assign_it_before_it_is_due

  def assign_it_before_it_is_due
    if date >= due
      errors.add(:assign_it_before_it_is_due, ", the assignment can't be due before it is assigned!")
    end
  end

  def submission(student)
    student.completed_assignments.find_by_assignments_id(self.id)
  end

  def complete?(student)
    a = submission(student)
    a && a.completed == true
  end

  def for_review?(student)
    a = submission(student)
    a && a.completed == false
  end

  def incomplete?(student)
    submission(student) == nil
  end
end
