class DeleteSubjectContents < ActiveRecord::Migration
  def up
    remove_column :contents, :subject
  end

  def down
  end
end
