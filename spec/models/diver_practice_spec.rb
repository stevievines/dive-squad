require 'rails_helper'

RSpec.describe DiverPractice, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:diver_practice)).to be_valid
  end

  describe '#was_absent?' do
    context 'when diver was present' do
      let(:diver_practice) { FactoryGirl.create(:diver_practice, was_present: true) }
      it 'returns false' do
        expect(diver_practice.was_absent?).to eq(false)
      end
    end

    context 'when diver was absent' do
      let(:diver_practice) { FactoryGirl.create(:diver_practice, was_present: false) }
      it 'returns true' do
        expect(diver_practice.was_absent?).to eq(true)
      end
    end
  end
end
