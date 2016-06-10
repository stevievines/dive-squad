require 'rails_helper'

RSpec.describe Team, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:team)).to be_valid
  end

  describe '#current_month_attendance_to_csv' do
    let(:team) { FactoryGirl.create(:team) }
    let!(:practice) { FactoryGirl.create(:practice, team: team, date: Date.new(2009, 9, 17)) }
    let!(:diver) { FactoryGirl.create(:diver, team: team) }
    let!(:diver_practice) { FactoryGirl.create(:diver_practice, diver: diver, practice: practice, was_present: true) }

    it 'returns a csv of the team\'s attendance' do
      expect(team.current_month_attendance_to_csv).to eq("Diver,2009-09-17\nStevie Vines,Present\n")
    end
  end
end
