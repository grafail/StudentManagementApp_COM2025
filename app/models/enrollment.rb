class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  scope :with_student, ->(student) { where(user: student) }
  scope :with_lecturer, ->(lecturer) { where(subject: Subject.with_lecturer(lecturer)) }

end
