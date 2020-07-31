class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :staff, -> { with_any_role('staff') }
  scope :students, -> { with_any_role('student') }
  scope :admins, -> { with_any_role('admin') }

  def to_s
    email
  end

end
