class Vote < ApplicationRecord
  belongs_to :v_duty, polymorphic: true
  belongs_to :user


end
