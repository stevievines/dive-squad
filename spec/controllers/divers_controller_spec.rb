require 'rails_helper'

RSpec.describe DiversController, type: :controller do
  let(:team) { create(:team, name: 'test') }
  let(:coach) { create(:coach, teams: [team]) }
  let!(:diver) { create(:diver, name: 'test', team: team) }

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
      expect(xhr :get, :show, { id: diver.id, format: :js }).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { { diver: { name: 'test', team_id: team.id } } }

      it 'creates a diver' do
        expect { xhr :post, :create, valid_params }.to change { Diver.count }.by(1)
      end
    end
  end

  describe 'POST #deactivate' do
    context 'with valid params' do
      let(:valid_params) { { id: diver.id, deactivated_at: Time.now, deactivation_reason: 'slacker' } }
      let!(:practice_before_date) { create(:diver_practice, diver: diver, practice: create(:practice, date: 3.weeks.ago)) }
      let!(:practice_after_date) { create(:diver_practice, diver: diver, practice: create(:practice, date: 1.day.from_now)) }

      it 'updates a diver' do
        expect { post :deactivate, valid_params }.to change { diver.reload.deactivated_at }
          .from(nil).to(within(1.second).of(Time.now))
      end

      it 'deletes diver practices after the deactivation date but not before' do
        post :deactivate, valid_params
        expect(DiverPractice.exists?(id: practice_before_date.id)).to eq(true)
        expect(DiverPractice.exists?(id: practice_after_date.id)).to eq(false)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:valid_params) { { id: diver.id, diver: { name: 'party' } } }

      it 'updates a diver' do
        expect { xhr :put, :update, valid_params }.to change { diver.reload.name }
          .from('test').to('party')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with valid params' do
      let(:valid_params) { { id: diver.id } }

      it 'destroys a diver' do
        expect { xhr :delete, :destroy, valid_params }.to change { Diver.count }.by(-1)
      end
    end
  end
end
