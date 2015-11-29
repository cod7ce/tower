class CreateUsersProjectsJoinTable < ActiveRecord::Migration
  def change
    create_table :users_projects, id: false do |t|
      t.integer :user_id
      t.integer :project_id

      t.index :user_id
      t.index :project_id
    end
  end
end
