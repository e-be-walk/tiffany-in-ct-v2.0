class CreateWindows < ActiveRecord::Migration[5.2]
  def change
    create_table :windows do |t|
      t.integer :user_id
      t.integer :site_id
      t.string :name
      t.integer :year_created
      t.text :dedication
      t.text :window_info

      t.timestamps
    end
  end
end
