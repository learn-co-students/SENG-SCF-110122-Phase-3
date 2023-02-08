class CreateFeedings < ActiveRecord::Migration[6.1]
  def change
    create_table :feedings do |t|
      t.datetime :time
      t.belongs_to :dog, foreign_key: true, null: false
      # more explicitly states the relationship, makes query a little faster, constraint upon .save so foreign_key can't be null
    end
  end
end
