class RenameColumnToMicroposts < ActiveRecord::Migration[6.0]
  def change
    rename_column :microposts, :content, :understanding
  end
end
