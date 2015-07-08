class AddNullConstraintsToCommentableType < ActiveRecord::Migration
  def change
    change_column_null :comments, :commentable_type, false
  end
end
