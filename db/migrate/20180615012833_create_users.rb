class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
        t.string :name
        t.string :password_digest
        t.boolean :site_admin, :default => false
        t.string :uid

        t.timestamps
    end
  end
end
