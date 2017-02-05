require 'rails_helper'

RSpec.describe PracticesController, type: :controller do
  let(:team) { create(:team) }
  let!(:coach) { create(:coach, teams: [team]) }
  let!(:diver) { create(:diver, team: team, join_date: 3.months.ago) }
  let!(:practice) { create(:practice, team: team) }

  before do
    login(coach)
  end

  describe 'POST #add_practices' do
    before do
      # Sunday, January 1, 2017
       Timecop.freeze(Time.local(2017, 01, 01))
    end

    after do
      Timecop.return
    end

    context 'when submitting practice days' do
      let(:params) do
        {
          team_id: team.id,
          # Tuesday Thursday
          practice_days: ['2', '4']
        }
      end

      it 'creates practice for the current month on the specified days' do
        # there are 9 tuesdays and thursdays in January 2017
        expect { post :add_practices, params }.to change { Practice.count }.by(9)
      end

      it 'creates practices for each diver' do
        expect { post :add_practices, params }.to change { DiverPractice.count }.by(9)
      end
    end

    context 'when submitting a make up practice' do
      let(:params) do
        {
          team_id: team.id,
          date: "2017-02-05",
          is_makeup: "on"
        }
      end


      it 'creates a single makeup practice for the given day' do
        expect { post :add_practices, params }.to change { Practice.count }.by(1)
      end

      it 'creates a single makeup practice for each diver for the given day' do
        expect { post :add_practices, params }.to change { DiverPractice.count }.by(1)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when the practice is found' do
      let(:params) { { id: practice.id, team_id: team.id } }

      it 'destroys the practice' do
        expect { delete :destroy, params }.to change { Practice.count }.by(-1)
      end
    end
  end
end
