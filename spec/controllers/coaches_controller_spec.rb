require 'rails_helper'

RSpec.describe CoachesController, type: :controller do
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
      expect(xhr :get, :show, { id: coach.id, format: :js }).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { { coach: { name: 'test', email: 'test@gmail.com', password: 'password' } } }

      it 'creates a coach' do
        expect { post :create, valid_params }.to change { Coach.count }.by(1)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:valid_params) { { id: coach.id, coach: { name: 'party' } } }

      it 'updates a coach' do
        expect { put :update, valid_params }.to change { coach.reload.name }
          .from('Stevie Vines').to('party')
      end
    end
  end
end
