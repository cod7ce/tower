class AddTeamIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :team_id, :integer
    add_index :events, :team_id
  end
end
