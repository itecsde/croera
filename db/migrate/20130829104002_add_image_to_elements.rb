class AddImageToElements < ActiveRecord::Migration
  def change
    add_attachment :activity_sequences, :element_image
    add_attachment :guides, :element_image
    add_attachment :experiences, :element_image
  end
end
