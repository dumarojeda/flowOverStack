class Answer < ApplicationRecord
  has_many :comments, as: :c_duty
  has_many :votes, as: :v_duty
  belongs_to :user
  belongs_to :question

  validates :description, presence: true
end
