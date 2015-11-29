class Project < ActiveRecord::Base
  belongs_to :team
  belongs_to :creator, class_name: :User, foreign_key: :created_by
  has_many :todos
  has_and_belongs_to_many :users, join_table: :users_projects
end
