class AddUrlToResources < ActiveRecord::Migration
  def change
    add_column :applications, :url, :string
    add_column :devices, :url, :string
    add_column :people, :url, :string
    add_column :events, :url, :string
  end
end
