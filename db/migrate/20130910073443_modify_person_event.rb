class ModifyPersonEvent < ActiveRecord::Migration
  def up
    Event.create_translation_table! :description => :text
    Person.create_translation_table! :description => :text
    add_attachment :events, :element_image
    add_attachment :people, :element_image
  end

  def down
  end
end
