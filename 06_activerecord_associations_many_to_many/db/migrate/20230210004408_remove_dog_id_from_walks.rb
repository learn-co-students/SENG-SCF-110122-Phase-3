class RemoveDogIdFromWalks < ActiveRecord::Migration[6.1]
  def change
    remove_column :walks, :dog_id, :integer
  end
end
