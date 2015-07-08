class CommentableType < ActiveRecord::Migration
  def up
    add_column :comments, :commentable_type, :string
  end

  def down
  end
end
