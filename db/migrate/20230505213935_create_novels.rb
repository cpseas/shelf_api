class CreateNovels < ActiveRecord::Migration[7.0]
  def change
    create_table :novels do |t|
      t.string :title
      t.text :synopsis
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.date :published_date

      t.timestamps
    end
  end
end
