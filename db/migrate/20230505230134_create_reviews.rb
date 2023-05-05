class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :novel, null: false, foreign_key: true
      t.string :rated
      t.date :reviewed_date

      t.timestamps
    end
  end
end
