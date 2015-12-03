class Todo < ActiveRecord::Base
  include Eventable

  belongs_to :project
  belongs_to :creator, class_name: :User, foreign_key: :created_by
  belongs_to :handler, class_name: :User, foreign_key: :handled_by

  validates :creator, :project, :content, presence: true

  after_create :record_event

  def assigned!(current_user, assigned_user)
    return true if assigned_user == handler
    event_key = handler.nil? ? 'todo_assigned' : 'todo_reassigned'
    options   = {assigned_from: handler.try(:nickname), assigned_to: assigned_user.nickname}
    fire_event(current_user, project, event_key, options)
    update_attributes(handler: assigned_user)
  end

  def estimated!(current_user, date)
    options = {previous_date: estimated_completed_at, current_date: date}
    fire_event(current_user, project, 'todo_estimated', options)
    update_attributes(estimated_completed_at: date)
  end

  private
  def record_event
    fire_event(creator, project, 'todo_created')
  end
end
