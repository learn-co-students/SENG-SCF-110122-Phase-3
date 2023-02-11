class RemoveLastWalkedLastFedFromDogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :dogs, :last_fed_at, :datetime
    remove_column :dogs, :last_walked_at, :datetime
  end
end
