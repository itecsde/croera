class AddImageToEvent < ActiveRecord::Migration
  def change
    add_attachment :events, :element_image
  end
end
