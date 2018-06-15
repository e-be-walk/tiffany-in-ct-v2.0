class AddAttachmentImageToWindows < ActiveRecord::Migration[5.2]
  def self.up
    change_table :windows do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :windows, :image
  end
end
