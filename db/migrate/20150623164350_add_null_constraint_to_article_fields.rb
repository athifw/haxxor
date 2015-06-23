class AddNullConstraintToArticleFields < ActiveRecord::Migration
  def change
    change_column_null :articles, :title, false
    change_column_null :articles, :url, false
    change_column_null :articles, :password_digest, false
  end
end
