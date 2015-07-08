class AddColumnTravelWellToLres < ActiveRecord::Migration
  def change
    add_column :lres, :travel_well, :boolean      
  end
end
