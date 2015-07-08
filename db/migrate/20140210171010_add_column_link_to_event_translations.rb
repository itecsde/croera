class AddColumnLinkToEventTranslations < ActiveRecord::Migration
  def change
    add_column :event_translations, :link, :string
  end
end
