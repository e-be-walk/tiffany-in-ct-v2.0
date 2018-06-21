class AddWindowsCountToWindows < ActiveRecord::Migration[5.2]
  def change
    add_column :windows, :windows_count, :integer, :default => 0
  end
end
