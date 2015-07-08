class DeleteFieldsActivity < ActiveRecord::Migration
  def up
    remove_column :activities, :teacherMotivation
    remove_column :activities, :learnerMotivation
    remove_column :activities, :technicalMotivation
    remove_column :activities, :guidelinesPreparation
    remove_column :activities, :guidelinesIntroduction
    remove_column :activities, :guidelinesActivity
    remove_column :activities, :guidelinesAssessment
  end

  def down
  end
end
