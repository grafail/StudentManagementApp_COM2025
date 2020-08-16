class Grade < ApplicationRecord
  belongs_to :assessment
  belongs_to :user

  validates :user_id, :assessment_id, :grade, presence: true
  validates :grade, numericality: {greater_than_or_equal_to: 0}
  validates_uniqueness_of :assessment_id, scope: [:user_id]

  scope :with_student, ->(student) { where(user: student) }
  scope :with_lecturer, ->(lecturer) { where(assessment: Assessment.with_lecturer(lecturer)) }
end
