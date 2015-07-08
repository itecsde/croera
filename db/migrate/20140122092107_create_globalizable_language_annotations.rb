class CreateGlobalizableLanguageAnnotations < ActiveRecord::Migration
  def up
    create_table "globalizable_language_annotations", :force => true do |t|
      t.integer "globalizable_id"
      t.string "globalizable_type"
      t.integer "language_id"
    end
  end

  def down
  end
end
