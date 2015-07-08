class ChangeCircumstanceLocale < ActiveRecord::Migration
  def up
      change_table :circumstances do |t|
        t.remove :locale
        t.integer :locale_id
      end
  end

  def down
  end
end
