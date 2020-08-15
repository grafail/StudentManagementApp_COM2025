class Assessment < ApplicationRecord
  belongs_to :subject

  scope :with_student, ->(student) { where(subject: Subject.with_student(student)) }
  scope :with_lecturer, ->(lecturer) { where(subject: Subject.with_lecturer(lecturer)) }
end
