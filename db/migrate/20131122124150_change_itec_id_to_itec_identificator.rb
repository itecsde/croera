class ChangeItecIdToItecIdentificator < ActiveRecord::Migration
  def up
    rename_column :applications, :itec_id, :itec_identificator
  end

  def down
  end
end
