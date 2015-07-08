class AddRawHtmlToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :raw_html, :text       
  end
end
