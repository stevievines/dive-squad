require 'rails_helper'

RSpec.describe Diver, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:diver)).to be_valid
  end

  describe '#deactivated?' do
    context 'when a diver is deactivated' do
      let(:diver) { FactoryGirl.create(:diver, deactivated_at: Time.now) }
      it 'returns true' do
        expect(diver.deactivated?).to eq(true)
      end
    end

    context 'when a diver is not deactivated' do
      let(:diver) { FactoryGirl.create(:diver, deactivated_at: nil) }
      it 'returns false' do
        expect(diver.deactivated?).to eq(false)
      end
    end
  end
end
