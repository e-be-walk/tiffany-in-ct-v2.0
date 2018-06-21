class AddSiteWindowsCountToSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :site_windows_count, :integer, :default => 0

    Site.reset_column_information

    Site.all.each do |e|
      Site.update_counters e.id, :site_windows_count => e.windows.length
    end
  end
end
