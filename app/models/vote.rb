class Vote < ApplicationRecord
  belongs_to :v_duty, polymorphic: true
  belongs_to :user

  validates :user_id, uniqueness: {scope: [:v_duty_id, :v_duty_type]}

end
