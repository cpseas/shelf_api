class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.text :bio
      t.string :password
      t.string :role
      t.string :email

      t.timestamps
    end
  end
end
