class ModifyApplicationsDevicesResources < ActiveRecord::Migration
  def up
    Application.create_translation_table! :description => :text
    Device.create_translation_table! :description => :text
    add_attachment :applications, :element_image
    add_attachment :devices, :element_image
  end

  def down
  end
end
