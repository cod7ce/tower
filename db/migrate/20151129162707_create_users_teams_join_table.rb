class CreateUsersTeamsJoinTable < ActiveRecord::Migration
  def change
    create_table :users_teams, id: false do |t|
      t.integer :user_id
      t.integer :team_id

      t.index :user_id
      t.index :team_id
    end
  end
end
