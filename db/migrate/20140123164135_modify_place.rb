class ModifyPlace < ActiveRecord::Migration
  def up
    add_attachment :places, :element_image
  end

  def down
  end
end
