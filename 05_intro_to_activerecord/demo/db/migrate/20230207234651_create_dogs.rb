class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      puts t.class
      t.string  :name
      t.date :birthdate
      t.string :image_url
      t.string :breed
    end
  end
end

