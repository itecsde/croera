class AddHashResources < ActiveRecord::Migration
  def change
    add_column :events, :hash, :string
    add_column :applications, :hash, :string
    add_column :people, :hash, :string
  end
 
end

