class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true

  has_many :completed_assignments
  has_many :submissions
end
