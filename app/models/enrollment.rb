class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  validates :subject_id, :user_id, presence: true, numericality: :only_integer
  validates_uniqueness_of :subject_id, scope: [:user_id]

  scope :with_student, ->(student) { where(user: student) }
  scope :with_lecturer, ->(lecturer) { where(subject: Subject.with_lecturer(lecturer)) }

end
