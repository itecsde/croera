class AddContentRequirement < ActiveRecord::Migration
  def up
    create_table "content_concrete_requirements", :force => true do |t|
      t.string  "name"
      t.string  "optionality"
      t.text    "description"
      t.integer "activity_id"
    end
    create_table "content_concrete_requirement_content_annotations", :force => true do |t|
      t.integer "content_concrete_requirement_id"
      t.integer "content_id"
    end
    create_table "content_concrete_requirement_content_assignments", :force => true do |t|
      t.integer "content_concrete_requirement_id"
      t.integer "content_id"
    end
  end

  def down
  end
end
