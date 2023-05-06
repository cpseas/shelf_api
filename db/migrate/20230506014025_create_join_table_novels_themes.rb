class CreateJoinTableNovelsThemes < ActiveRecord::Migration[7.0]
  def change
    create_join_table :novels, :themes do |t|
      t.index [:novel_id, :theme_id]
      t.index [:theme_id, :novel_id]
    end
  end
end
