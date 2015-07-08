class CreateGuideResouceAnnotation < ActiveRecord::Migration
  def up
    create_table "guideResourceAnnotations", :force => true do |t|
      t.integer "guide_id"
      t.integer "resource_id"
    end
  end

  def down
    drop_table "guideResourceAnnotations"
  end
end
