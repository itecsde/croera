class ModifyLocationEvent < ActiveRecord::Migration
  def up
    remove_column :events, :latitude
    remove_column :events, :longitude
    add_column :events, :longitude, :float
    add_column :events, :latitude, :float
  end

  def down
  end
end
