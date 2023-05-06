class CreateJoinTableNovelsGenres < ActiveRecord::Migration[7.0]
  def change
    create_join_table :novels, :genres do |t|
      t.index [:novel_id, :genre_id]
      t.index [:genre_id, :novel_id]
    end
  end
end
