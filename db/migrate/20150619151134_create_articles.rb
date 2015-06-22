class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.string :author
      
      t.timestamps null: false
    end

    change_column_null :articles, :title, false
    change_column_null :articles, :url, false
    change_column_null :articles, :author, false
  end
end
