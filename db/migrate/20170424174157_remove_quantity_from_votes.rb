class RemoveQuantityFromVotes < ActiveRecord::Migration[5.0]
  def change
    remove_column :votes, :quantity
  end
end
