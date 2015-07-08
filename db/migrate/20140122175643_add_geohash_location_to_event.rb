class AddGeohashLocationToEvent < ActiveRecord::Migration
  def change
    add_column :events, :geohash_location, :string
  end
end
