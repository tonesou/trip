class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      
      t.integer :user_id
      t.string :country
      t.string :city
      t.string :genre
      t.text :explain

      t.timestamps
    end
  end
end
