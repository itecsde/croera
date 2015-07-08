class ModifyPeople < ActiveRecord::Migration
  def up
     add_column :people, :mother_tongue_id, :integer
     add_column :people, :address, :string
     add_column :people, :latitude, :string
     add_column :people, :longitude, :string
     
     create_table "person_subject_annotations", :force => true do |t|
      t.integer "person_id"
      t.integer "subject_id"
      t.integer "level"
     end
     
     create_table "person_language_annotations", :force => true do |t|
      t.integer "person_id"
      t.integer "contextual_language_id"   
     end
  end

  def down
  end
end
