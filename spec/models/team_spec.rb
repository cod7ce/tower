require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'validations' do
    let(:team) { build(:team) }

    it 'should be valid' do
      expect(team).to be_valid
    end

    it 'should require creator' do
      team.creator = nil
      expect(team).to be_invalid
    end

    it 'should require name' do
      team.name = ''
      expect(team).to be_invalid
    end
  end

  describe 'callbacks' do
    let(:team) { build(:team) }

    describe 'after save' do
      it 'should call record_event' do
        expect(team).to receive(:record_event).once
        team.save
      end
    end
  end
end
