require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:coach) { create(:coach) }

  describe 'POST #create' do
    context 'when credentials are valid' do
      it 'sets the coach_id in the session' do
        expect(session[:coach_id]).to be_nil
        post :create, { email: coach.email, password: coach.password }
        expect(session[:coach_id]).to eq(coach.id)
      end

      it 'redirects to the root path' do
        expect(
          post :create, { email: coach.email, password: coach.password }
        ).to redirect_to(root_path)
      end
    end

    context 'when credentials are not valid' do
      it 'redirects to the login path' do
        expect(
          post :create, { email: coach.email, password: nil }
        ).to redirect_to(login_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      login(coach)
    end

    it 'clears the coach id from the session' do
      expect(session[:coach_id]).to eq(coach.id)
      delete :destroy
      expect(session[:coach_id]).to be_nil
    end

    it 'redirects to the login path' do
      expect(delete :destroy).to redirect_to(login_path)
    end
  end

end

