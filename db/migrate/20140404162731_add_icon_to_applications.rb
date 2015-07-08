class AddIconToApplications < ActiveRecord::Migration
  def change
    add_attachment :applications, :icon
  end
end
