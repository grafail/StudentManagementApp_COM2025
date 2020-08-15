class Subject < ApplicationRecord
  belongs_to :course
  belongs_to :user

  scope :with_lecturer, ->(lecturer) { where(user: lecturer) }
  scope :student_can_enroll, ->(student) { where(course: student.course_id) }
  scope :with_student, ->(student) { Enrollment.with_student(student) }

end
