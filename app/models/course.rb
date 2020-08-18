class Course < ApplicationRecord
  has_many :subjects, dependent: :destroy
  has_many :users

  validates :title, :year, :courseType, presence: true
  validates :year, numericality: {greater_than_or_equal_to: 0, only_integer: true}

  def to_s
    courseType + ' ' + title
  end
end
