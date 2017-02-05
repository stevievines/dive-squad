require 'rails_helper'

RSpec.describe SettingsController, type: :controller do
  let(:team) { create(:team) }
  let(:coach) { create(:coach, teams: [team]) }

  before do
    login(coach)
  end

  describe 'GET show' do
    it 'responds with an ok status' do
      expect(get :show).to have_http_status(:ok)
    end
  end

end
