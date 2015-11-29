class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :target_id
      t.string :target_type
      t.integer :entity_id
      t.string :entity_type
      t.integer :fired_by
      t.string :content

      t.timestamps null: false

      t.index :fired_by
      t.index [:target_id, :target_type]
      t.index [:entity_id, :entity_type]
    end
  end
end
