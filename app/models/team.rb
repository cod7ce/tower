class Team < ActiveRecord::Base
  include Eventable

  belongs_to :creator, class_name: :User, foreign_key: :created_by
  has_many :projects
  has_many :events
  has_and_belongs_to_many :members, join_table: :users_teams, class_name: :User

  validates :creator, :name, presence: true

  after_save :record_event

  private
  def record_event
    event_key = id_changed? ? :team_created : :team_updated
    fire_event(creator, self, event_key)
  end
end
