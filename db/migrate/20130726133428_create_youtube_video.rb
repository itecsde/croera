class CreateYoutubeVideo < ActiveRecord::Migration
  def up
    create_table "youtube_items", :force => true do |t|
      t.string "name"
      t.text "description"
    end
  end

  def down
  end
end
