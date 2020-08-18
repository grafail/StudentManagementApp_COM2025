class Course < ApplicationRecord
  has_many :subjects, dependent: :destroy
  has_many :users

  validates :title, :year, :courseType, presence: true
  validates :year, numericality: :only_integer

  def to_s
    courseType + ' ' + title
  end
end
