class User < ApplicationRecord
  rolify before_add: :before_add_method
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, :lastname, :email, presence: true

  has_many :enrollments, dependent: :destroy
  has_many :grades, dependent: :destroy

  belongs_to :course, optional: true
  # Check if a course is present only if a user has one assigned
  validates_presence_of :course, if: :course_id_present?

  # Checks if a course is present
  def course_id_present?
    self.course_id.present?
  end

  # Ensure each user only has one role
  def before_add_method(role)
    self.roles = []
  end

  scope :staff, -> { with_any_role('staff') }
  scope :students, -> { with_any_role('student') }
  scope :admins, -> { with_any_role('admin') }

  # Adjusts string output
  def to_s
    firstname + ' ' + lastname
  end

end
