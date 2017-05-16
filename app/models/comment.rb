class Comment < ApplicationRecord
  belongs_to :c_duty, polymorphic: true
  belongs_to :user

  validates :description, presence: true
end
