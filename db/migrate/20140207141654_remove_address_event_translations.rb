class RemoveAddressEventTranslations < ActiveRecord::Migration
  def up
    remove_column :event_translations, :address
  end

  def down
  end
end
