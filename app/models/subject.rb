class Subject < ApplicationRecord
  belongs_to :course
  belongs_to :user
  has_many :assessments, dependent: :destroy
  has_many :enrollments, dependent: :destroy

  validates :course_id, :user_id, :title, presence: true
  validates :course_id, :user_id, numericality: :only_integer
  validates_uniqueness_of :course_id, scope: [:user_id]

  scope :with_lecturer, ->(lecturer) { where(user: lecturer) }
  scope :student_can_enroll, ->(student) { where(course: student.course_id) }
  scope :with_student, ->(student) { Enrollment.with_student(student) }

end
