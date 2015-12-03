require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'validations' do
    let(:project) { build(:project) }

    it 'should be valid' do
      expect(project).to be_valid
    end

    it 'should require creator' do
      project.creator = nil
      expect(project).to be_invalid
    end

    it 'should require team' do
      project.team = nil
      expect(project).to be_invalid
    end

    it 'should require name' do
      project.name = ''
      expect(project).to be_invalid
    end
  end

  describe 'callbacks' do
    let(:project) { build(:project) }

    describe 'after save' do
      it 'should call record_event' do
        expect(project).to receive(:record_event).once
        project.save
      end
    end
  end
end
