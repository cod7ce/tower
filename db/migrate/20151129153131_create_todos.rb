class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :content
      t.integer :created_by
      t.integer :project_id
      t.integer :handled_by
      t.datetime :estimated_completed_at

      t.timestamps null: false

      t.index :created_by
      t.index :project_id
      t.index :handled_by
    end
  end
end
