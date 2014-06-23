class CompletedAssignment < ActiveRecord::Base
  validates :url, presence: true

  belongs_to :user
  belongs_to :assignments
end
