class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :quantity
      t.integer :v_duty_id
      t.string :v_duty_type
      t.integer :user_id

      t.timestamps
    end
  end
end
