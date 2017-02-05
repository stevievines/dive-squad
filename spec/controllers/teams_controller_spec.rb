require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  let(:team) { create(:team, name: 'test') }
  let(:coach) { create(:coach, teams: [team]) }

  before do
    login(coach)
  end

  describe 'GET #new' do
    it 'responds with an ok status' do
      expect(xhr :get, :new, { format: :js }).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'responds with an ok status' do
      expect(xhr :get, :show, { id: team.id, format: :js }).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { { team: { name: 'test' } } }

      it 'creates a team' do
        expect { post :create, valid_params }.to change { Team.count }.by(1)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:valid_params) { { id: team.id, team: { name: 'party' } } }

      it 'updates a team' do
        expect { put :update, valid_params }.to change { team.reload.name }
          .from('test').to('party')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid params' do
      let(:valid_params) { { id: team.id } }

      it 'destroys a team' do
        expect { delete :destroy, valid_params }.to change { Team.count }.by(-1)
      end
    end
  end
end
