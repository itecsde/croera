class Experiences < ActiveRecord::Migration
  def up
    create_table "experience_steps", :force => true do |t|
      t.string "name"
      t.text "description"
      t.integer "position"
      t.integer "experience_id"
    end
    
    create_table "experience_step_contribution_annotation", :force => true do |t|
      t.string "name"
      t.text "description"
      t.integer "position"
      t.integer "experience_step_id"
      t.integer "contribution_type"
      t.integer "contribution_id"
    end
    
    create_table "pictures", :force => true do |t|
      t.string "name"
      t.text "description"
    end
    
    create_table "reflexions", :force => true do |t|
      t.string "name"
      t.text "description"
    end
    
    drop_table "boxes"

    create_table "boxes", :force => true do |t|
      t.integer "document_id"
      t.integer "document_type"
      t.string  "box_type"
      t.integer "position"
    end    
  end

  def down
  end
end
