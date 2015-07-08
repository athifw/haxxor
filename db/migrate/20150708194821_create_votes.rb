class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :score, null: false
      t.timestamps null: false
      t.references :voteable, polymorphic: true, index: true, null: false
      t.integer :user_id, null: false
    end
  end
end