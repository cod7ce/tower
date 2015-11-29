class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :created_by

      t.timestamps null: false

      t.index :created_by
    end
  end
end
