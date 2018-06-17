class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.integer :user_id
      t.integer :site_id
      t.timestamps
    end
  end
end
