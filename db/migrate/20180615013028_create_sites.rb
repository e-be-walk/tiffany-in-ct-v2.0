class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.integer :user_id
      t.string :name
      t.string :street_address
      t.string :city
      t.integer :zip_code
      t.text :contact_info
      t.text :accessibility
      t.text :site_info
      t.timestamps
    end
  end
end
