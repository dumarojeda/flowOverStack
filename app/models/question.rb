class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :comments, as: :c_duty
  has_many :votes, as: :v_duty
  
  validates :name, :description, presence: true
end
