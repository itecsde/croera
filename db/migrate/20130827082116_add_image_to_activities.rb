class AddImageToActivities < ActiveRecord::Migration
  def change
    add_attachment :activities, :element_image
  end
end
