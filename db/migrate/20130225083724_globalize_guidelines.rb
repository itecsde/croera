class GlobalizeGuidelines < ActiveRecord::Migration
  def up
    add_column :activity_translations, :guidelinesPreparation, :text
    add_column :activity_translations, :guidelinesIntroduction, :text
    add_column :activity_translations, :guidelinesActivity, :text
    add_column :activity_translations, :guidelinesAssessment, :text
  end

  def down
  end
end
