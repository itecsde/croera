class AddInfoToWikifyToLectureTranslations < ActiveRecord::Migration
  def change
    add_column :lecture_translations, :info_to_wikify, :text     
  end
end
