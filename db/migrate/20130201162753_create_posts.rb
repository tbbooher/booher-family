class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :tag_id
      t.belongs_to :user_id
      t.text :body
      t.string :title

      t.timestamps
    end
    add_index :posts, :tag_id_id
    add_index :posts, :user_id_id
  end
end
