class AddElementImageToSources < ActiveRecord::Migration
  def change
    add_attachment :sources, :element_image    
  end
end
