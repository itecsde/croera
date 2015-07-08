class AddColumnRawHtmlToBiographies < ActiveRecord::Migration
  def change
    add_column :biographies, :raw_html, :text        
  end
end
