class AddAttachmentImageToSites < ActiveRecord::Migration[5.2]
  def self.up
    change_table :sites do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :sites, :image
  end
end
