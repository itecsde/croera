class RemoveAddressContextualSetting < ActiveRecord::Migration
  def up
    remove_column :contextual_settings, :street_address
    remove_column :contextual_settings, :postal_code
    remove_column :contextual_settings, :locality
    remove_column :contextual_settings, :country
    add_column :contextual_settings, :address, :string
    add_column :contextual_settings, :latitude, :string
    add_column :contextual_settings, :longitude, :string
  end

  def down
  end
end
