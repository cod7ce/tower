class EventsController < ApplicationController
  def index
    authorize Event
    @firers = policy_scope(team.members).ordered
    @events = policy_scope(team.events).fired_by(params[:user_id]).ordered.page(params[:page])
  end

  private
  def team
    @team ||= policy_scope(Team).find(params[:team_id])
  end
end
