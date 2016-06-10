require 'rails_helper'

RSpec.describe Dive, type: :model do
  let(:dive) { FactoryGirl.create(:dive) }

  it 'has a valid factory' do
    expect(dive).to be_valid
  end

  describe 'display_description' do
    it 'concatenates the number, height, and description' do
      expect(dive.display_description).to eq('5337D 3M -- Reverse 1 1/2 Somersault 3 1/2 Twist Free')
    end
  end
end
