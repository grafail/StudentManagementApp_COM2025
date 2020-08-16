class User < ApplicationRecord
  rolify before_add: :before_add_method
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :enrollments, dependent: :destroy
  has_many :grades, dependent: :destroy

  belongs_to :course, optional: true

  def before_add_method(role)
    self.roles = []
  end

  scope :staff, -> { with_any_role('staff') }
  scope :students, -> { with_any_role('student') }
  scope :admins, -> { with_any_role('admin') }

  def to_s
    email
  end

end
