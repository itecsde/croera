class CreateArticleSubjectAnnotations < ActiveRecord::Migration
  def up
    create_table "article_subject_annotations", :force => true do |t|
      t.integer "article_id"
      t.integer "subject_id"
      t.float "weight"
    end
  end

  def down
  end
end
