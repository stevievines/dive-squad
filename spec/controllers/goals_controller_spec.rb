require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  let(:team) { create(:team) }
  let!(:coach) { create(:coach, teams: [team]) }
  let!(:diver) { create(:diver, team: team) }

  before do
    login(coach)
  end

  describe 'GET #index' do
    before do
      get :index, params: {}
    end

    it 'has an ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns divers' do
      expect(assigns(:divers)).to eq([diver])
    end
  end

  describe 'POST #create' do
    context 'when goal dives are included' do
      let!(:dive) { create(:dive) }
      let(:valid_params) do
        {
          diver_id: diver.id,
          dives: [dive.id]
        }
      end

      it 'creates goals' do
        expect { post :create, valid_params }.to change { Goal.count }.by(1)
      end

      it 'redirects to the dashboard' do
        expect(post :create, valid_params).to redirect_to(dashboard_path)
      end

      context 'when the goal dive already exists' do
        let!(:existing_goal) { create(:goal, dive: dive) }
        let!(:existing_goal_dive) { create(:diver_goal, diver: diver, goal: existing_goal) }

        it 'flashes an error' do
          post :create, valid_params
          expect(flash[:danger]).to be_present
        end

        it 'redirects to the dashboard' do
          expect(post :create, valid_params).to redirect_to(dashboard_path)
        end
      end
    end
  end

end
