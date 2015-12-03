require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  describe "GET #index" do
    let!(:user_1) { create(:user, nickname: 'anney') }
    let!(:user_2) { create(:user, nickname: 'david') }
    let!(:team) { create(:team) }
    let!(:project) { create(:project) }
    let!(:todo) { create(:todo) }

    before do
      team.members << user_1
      team.members << user_2

      project.users << user_1
      project.users << user_2
    end

    it 'returns http success' do
      get :index, team_id: team.id
      expect(response).to have_http_status(:success)
    end

    it 'assigned firers' do
      get :index, team_id: team.id
      expect(assigns(:firers)).to eq([user_1, user_2])
    end

    describe 'without filter' do
      it 'assigned events' do
        get :index, team_id: team.id
        expect(assigns(:events).size).to eq(2)
      end
    end

    describe 'filter by firer' do
      it 'assigned events' do
        get :index, team_id: team.id, user_id: user_2
        expect(assigns(:events).size).to eq(0)
      end
    end
  end
end
