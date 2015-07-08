class ChangeItecIdentificatorToItecId < ActiveRecord::Migration
  def up
     rename_column :applications, :itec_identificator, :itec_id
  end

  def down
  end
end
