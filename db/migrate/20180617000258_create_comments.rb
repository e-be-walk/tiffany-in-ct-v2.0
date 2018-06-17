class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.integer :user_comments_id
      t.string :user_comments_type
      t.timestamps
    end

    add_index :comments, [:user_comments_id, :user_comments_type]
  end
end
