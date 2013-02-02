class RemoveFieldsFromBlogItems < ActiveRecord::Migration
  def change
    remove_column :blogs, :user_id_id
    remove_column :posts, :tag_id_id
    remove_column :posts, :user_id_id
  end

end
