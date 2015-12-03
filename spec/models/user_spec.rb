require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { build(:user) }

    it 'should be valid' do
      expect(user).to be_valid
    end

    it 'should require nickname' do
      user.nickname = nil
      expect(user).to be_invalid
    end
  end

  describe 'scopes' do
    let!(:user_1) { create(:user, nickname: 'anney') }
    let!(:user_2) { create(:user, nickname: 'david') }

    describe '.ordered' do
      it 'should return users by nickname first letter' do
        expect(User.ordered).to eq([user_1, user_2])
      end
    end
  end
end
