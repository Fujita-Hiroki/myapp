class CreateMicropostTagRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :micropost_tag_relationships do |t|
      t.references :micropost, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
