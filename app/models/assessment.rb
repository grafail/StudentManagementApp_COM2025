class Assessment < ApplicationRecord
  belongs_to :subject
  has_many :grades, dependent: :destroy

  validates :subject_id, :name, presence: true

  scope :with_student, ->(student) { where(subject: Subject.with_student(student)) }
  scope :with_lecturer, ->(lecturer) { where(subject: Subject.with_lecturer(lecturer)) }
end
