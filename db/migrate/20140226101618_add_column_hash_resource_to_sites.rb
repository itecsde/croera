class AddColumnHashResourceToSites < ActiveRecord::Migration
  def change
    add_column :sites, :hash_resource, :string    
  end
end
