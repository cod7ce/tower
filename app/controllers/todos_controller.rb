class TodosController < ApplicationController
  def create
    @todo = Todo.create(project: current_user.projects.sample, creator: current_user, content: "新的任务")
    client = Faye::Client.new(Figaro.env.faye_server)
    client.publish('/events/private', render_to_string(partial: '/events/event', locals: {event: @todo.events.last}, layout: false))
    render json: @todo
  end
end
