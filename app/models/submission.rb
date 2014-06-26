class Submission < ActiveRecord::Base
  validates :url, presence: true

  belongs_to :user
  belongs_to :assignment
end
