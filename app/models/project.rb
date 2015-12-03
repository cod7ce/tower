class Project < ActiveRecord::Base
  include Eventable

  belongs_to :team
  belongs_to :creator, class_name: :User, foreign_key: :created_by
  has_many :todos
  has_and_belongs_to_many :users, join_table: :users_projects

  validates :team, :creator, :name, presence: true

  after_save :record_event

  private
  def record_event
    event_key = id_changed? ? :project_created : :project_updated
    fire_event(creator, self, event_key)
  end
end
