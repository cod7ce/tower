class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :created_by
      t.integer :target_id
      t.string :target_type

      t.timestamps null: false

      t.index :created_by
      t.index [:target_id, :target_type]
    end
  end
end
