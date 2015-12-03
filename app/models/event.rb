class Event < ActiveRecord::Base
  serialize :options, Hash

  belongs_to :firer, class_name: :User, foreign_key: :fired_by
  belongs_to :team
  belongs_to :target, polymorphic: true
  belongs_to :entity, polymorphic: true

  validates :firer, :target, :entity, :key, presence: true

  scope :ordered, -> { order(id: :desc) }
  scope :fired_by, ->(user_id) { user_id.blank? ? all : where(arel_table[:fired_by].eq(user_id)) }
end
