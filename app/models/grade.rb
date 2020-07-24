class Grade < ApplicationRecord
  belongs_to :assesment
  belongs_to :user
end
