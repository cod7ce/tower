class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :created_by
      t.integer :team_id

      t.timestamps null: false

      t.index :created_by
      t.index :team_id
    end
  end
end
