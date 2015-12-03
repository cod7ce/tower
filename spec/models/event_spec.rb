require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    let(:event) { build(:event) }

    it 'should be valid' do
      expect(event).to be_valid
    end

    it 'should require firer' do
      event.firer = nil
      expect(event).to be_invalid
    end

    it 'should require key' do
      event.key = ""
      expect(event).to be_invalid
    end

    it 'should require target' do
      event.target = nil
      expect(event).to be_invalid
    end

    it 'should require entity' do
      event.entity = nil
      expect(event).to be_invalid
    end
  end

  describe 'scopes' do
    let!(:user) { create(:user) }
    let!(:unknown) { create(:user) }
    let!(:team_1) { create(:team, creator: user) }
    let!(:team_2) { create(:team, creator: unknown) }
    let!(:event_1) { team_1.events.first }
    let!(:event_2) { team_2.events.first }

    describe '.ordered' do
      it 'should return events with an order' do
        expect(Event.ordered).to eq([event_2, event_1])
      end
    end

    describe '.fired_by' do
      it 'should return events fired by assigned user' do
        expect(Event.fired_by(user.id)).to eq([event_1])
      end

      it 'should reutrn all events assigned nothing' do
        expect(Event.fired_by(nil)).to eq([event_1, event_2])
      end
    end
  end
end
