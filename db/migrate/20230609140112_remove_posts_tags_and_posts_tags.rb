class RemovePostsTagsAndPostsTags < ActiveRecord::Migration[7.0]
  def change
    drop_table :posts_tags
    drop_table :posts
    drop_table :tags
  end
end
