class CreateElementCategoryAnnotations < ActiveRecord::Migration
  def up
     create_table "element_category_annotations", :force => true do |t|
      t.integer "categorizable_id"
      t.string "categorizable_type"
      t.integer "category_id"
      t.float "weight"
      t.string "type_category"
    end
  end

  def down
  end
end
