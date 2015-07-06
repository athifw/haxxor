class ChangeCommentsToPolymorphic < ActiveRecord::Migration
  def up
    rename_column :comments, :article_id, :commentable_id
    add_column :comments, :commentable_type, :string

    execute "UPDATE comments SET commentable_type = 'Article'"
  end

  def down
    rename_column :comments, :commentable_id, :article_id
    remove_column :comments, :commentable_type
  end
end
