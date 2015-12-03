class Comment < ActiveRecord::Base
  include Eventable

  belongs_to :creator, class_name: :User, foreign_key: :created_by
  belongs_to :target, polymorphic: true

  validates :creator, :target, :content, presence: true

  after_create :record_event

  private
  def record_event
    fire_event(creator, target.project, "comment_replied_#{target_type.downcase}")
  end
end
