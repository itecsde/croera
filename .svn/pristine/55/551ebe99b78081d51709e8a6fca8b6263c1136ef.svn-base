class ModifyLocationPerson < ActiveRecord::Migration
  def up
    remove_column :people, :latitude
    remove_column :people, :longitude
    add_column :people, :longitude, :float
    add_column :people, :latitude, :float
  end

  def down
  end
end
