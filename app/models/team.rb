class Team < ActiveRecord::Base
  belongs_to :creator, class_name: :User, foreign_key: :created_by
  has_many :projects
  has_and_belongs_to_many :users, join_table: :users_teams
end
