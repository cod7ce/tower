class User < ActiveRecord::Base
  has_and_belongs_to_many :projects, join_table: :users_projects
  has_and_belongs_to_many :teams, join_table: :users_teams

  validates :nickname, presence: true

  scope :ordered, -> { order(nickname: :asc) }
end
