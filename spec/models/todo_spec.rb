require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'validations' do
    let(:todo) { build(:todo) }

    it 'should be valid' do
      expect(todo).to be_valid
    end

    it 'should require creator' do
      todo.creator = nil
      expect(todo).to be_invalid
    end

    it 'should require project' do
      todo.project = nil
      expect(todo).to be_invalid
    end

    it 'should require content' do
      todo.content = ''
      expect(todo).to be_invalid
    end
  end

  describe 'callbacks' do
    let(:todo) { build(:todo) }

    describe 'after save' do
      it 'should call record_event' do
        expect(todo).to receive(:record_event).once
        todo.save
      end
    end
  end

  describe '#assigned!' do
    let(:current_user) { create(:user) }
    let(:user) { create(:user) }

    before do
      todo.assigned!(current_user, user)
    end

    describe 'todo without handler' do
      let(:todo) { create(:todo) }

      it 'should set handler' do
        expect(todo.reload.handler).to eq(user)
      end

      it 'should record a new event' do
        expect(Event.where(entity: todo, key: :todo_assigned).size).to eq(1)
      end
    end

    describe 'todo with handler' do
      let(:todo) { create(:todo, :with_handler) }

      it 'should set handler' do
        expect(todo.handler).to eq(user)
      end

      it 'should record a new event' do
        expect(Event.where(entity: todo, key: :todo_reassigned).size).to eq(1)
      end

      describe 'assigned user is same with handler' do
        let(:user) { todo.handler }

        it 'should not record a new event' do
          expect(Event.where(entity: todo, key: :todo_reassigned).size).to eq(0)
        end
      end
    end
  end

  describe '#estimated!' do
    let(:current_user) { create(:user) }
    let(:date) { Time.current.tomorrow }

    before do
      todo.estimated!(current_user, date)
    end

    describe 'todo without estimated' do
      let(:todo) { create(:todo) }

      it 'should set estimated_completed_at' do
        expect(todo.estimated_completed_at).to eq(date)
      end

      it 'should record a new event' do
        expect(Event.where(entity: todo, key: :todo_estimated).size).to eq(1)
      end
    end

    describe 'todo with estimated' do
      let(:todo) { create(:todo, :with_handler) }

      it 'should set estimated_completed_at' do
        expect(todo.estimated_completed_at).to eq(date)
      end

      it 'should record a new event' do
        expect(Event.where(entity: todo, key: :todo_estimated).size).to eq(1)
      end
    end
  end
end
