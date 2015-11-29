class Todo < ActiveRecord::Base
  belongs_to :project
  belongs_to :creator, class_name: :User, foreign_key: :created_by
  belongs_to :handler, class_name: :User, foreign_key: :handled_by
end
