class Course < ApplicationRecord
  has_many :subjects, dependent: :destroy
  has_many :users

  validates :title, :year, presence: true
  validates :year, numericality: :only_integer

  def to_s
    title
  end
end
