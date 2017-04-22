class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :c_duty_id
      t.string :c_duty_type
      t.integer :user_id

      t.timestamps
    end
  end
end
