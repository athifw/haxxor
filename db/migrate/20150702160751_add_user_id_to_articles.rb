class AddUserIdToArticles < ActiveRecord::Migration
  def up
    #add user id column
    add_column :articles, :user_id, :integer

    #converts username to id
    execute <<-SQL
      UPDATE articles
      SET user_id = users.id
      FROM users
      WHERE users.username = articles.author
    SQL

    #drop author column from article
    remove_column :articles, :author

    #add null constraint to user id
    change_column_null :articles, :user_id, false
  end

  def down
    #add author column
    add_column :articles, :author, :string

    #converts id to username
    execute <<-SQL
      UPDATE articles
      SET author = users.username
      FROM users
      WHERE users.id = articles.user_id
    SQL

    #drop user id column
    remove_column :articles, :user_id

    #drop null constrint to user id
    change_column_null :articles, :author, false

  end
end
