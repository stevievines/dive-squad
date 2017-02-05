require 'rails_helper'

RSpec.describe DiverPracticesController, type: :controller do
  let(:team) { create(:team) }
  let!(:coach) { create(:coach, teams: [team]) }
  let!(:diver) { create(:diver, team: team) }
  let!(:practice) { create(:practice, team: team) }
  let!(:diver_practice) { create(:diver_practice, diver: diver, practice: practice, was_present: false) }

  before do
    login(coach)
  end

  describe 'POST #toggle_attendance' do
    context 'when params are valid' do
      it 'toggles practice attendance' do
        expect { post :toggle_attendance, diver_id: diver.id, id: diver_practice.id, format: :js }
          .to change { diver_practice.reload.was_present }.from(false).to(true)
      end
    end
  end

  describe 'POST #set_minutes_late' do
    context 'when params are valid' do
      it 'sets minutes late on the practice' do
        expect { post :set_minutes_late, diver_id: diver.id, id: diver_practice.id, minutes_late: 10, format: :js }
          .to change { diver_practice.reload.minutes_late }.from(nil).to(10)
      end
    end
  end

  describe 'POST #set_excuse' do
    context 'when params are valid' do
      it 'sets the excuse' do
        expect { post :set_excuse, diver_id: diver.id, id: diver_practice.id, excuse: 'dog coma', format: :js }
          .to change { diver_practice.reload.excuse }.from(nil).to('dog coma')
      end
    end
  end
end
