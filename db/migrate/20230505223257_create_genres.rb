class CreateGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :genres do |t|
      t.string :name
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
