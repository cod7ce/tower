require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    let(:comment) { build(:comment) }

    it 'should be valid' do
      expect(comment).to be_valid
    end

    it 'should require creator' do
      comment.creator = nil
      expect(comment).to be_invalid
    end

    it 'should require content' do
      comment.content = ""
      expect(comment).to be_invalid
    end

    it 'should require target' do
      comment.target = nil
      expect(comment).to be_invalid
    end
  end

  describe 'callbacks' do
    let(:comment) { build(:comment) }

    describe 'after save' do
      it 'should call record_event' do
        expect(comment).to receive(:record_event).once
        comment.save
      end
    end
  end
end
