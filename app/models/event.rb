class Event < ActiveRecord::Base
  belongs_to :firer, class_name: :User, foreign_key: :fired_by
  belongs_to :target, polymorphic: true
  belongs_to :entity, polymorphic: true

  validates :firer, :target, :entity, :content, presence: true

  scope :ordered, -> { order(id: :desc) }
end
