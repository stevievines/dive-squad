require 'rails_helper'

RSpec.describe Goal, type: :model do
  let(:goal) { FactoryGirl.create(:goal) }

  it 'has a valid factory' do
    expect(goal).to be_valid
  end

  it 'delegates display_description to dive' do
    expect(goal.display_description).to eq(goal.dive.display_description)
  end
end
