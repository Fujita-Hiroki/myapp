class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.string :picture
      t.references :micropost, foreign_key: true

      t.timestamps
    end
    add_index :comments, [:user_id, :micropost_id, :created_at]
  end
end
