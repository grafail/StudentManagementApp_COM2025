class Grade < ApplicationRecord
  belongs_to :assessment
  belongs_to :user

  scope :with_student, ->(student) { where(user: student) }
  scope :with_lecturer, ->(lecturer) { where(assessment: Assessment.with_lecturer(lecturer)) }
end
