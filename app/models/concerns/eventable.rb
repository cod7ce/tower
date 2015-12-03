module Eventable
  extend ActiveSupport::Concern

  included do
    def fire_event(firer, target, key, options = nil)
      team = target.is_a?(Team) ? target : target.team
      Event.create(team: team, firer: firer, target: target, entity: self, key: key, options: options)
    end
  end
end
