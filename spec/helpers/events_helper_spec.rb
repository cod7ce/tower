require 'rails_helper'

RSpec.describe EventsHelper, type: :helper do
  describe "event_content" do
    let!(:project) { create(:project) }

    it 'should return event text' do
      expect(helper.event_content(Event.last)).to eq("创建了项目 : ")
    end
  end

  describe "firer_options" do
    let!(:user_1) { create(:user, nickname: 'anney') }
    let!(:user_2) { create(:user, nickname: 'david') }

    it 'should return event text' do
      expect(helper.firer_options(User.all)).to eq("<option value=\"1\">anney</option>\n<option value=\"2\">david</option>")
    end
  end
end
