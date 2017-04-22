class Comment < ApplicationRecord
  belongs_to :c_duty, polymorphic: true
  belongs_to :user
end
