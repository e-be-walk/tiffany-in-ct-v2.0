class CreateUserComments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_comments do |t|
      t.string :comment_text
      t.integer :user_id
      t.integer :site_id
      t.integer :window_id
    end
  end
end
