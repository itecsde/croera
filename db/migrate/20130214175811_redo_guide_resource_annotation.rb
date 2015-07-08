class RedoGuideResourceAnnotation < ActiveRecord::Migration
  def up
    drop_table "guideResourceAnnotations"
    
    create_table "guide_resource_annotations", :force => true do |t|
      t.integer "guide_id"
      t.integer "resource_id"
    end
  end

  def down
  end
end
