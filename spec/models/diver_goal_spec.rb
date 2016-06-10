require 'rails_helper'

RSpec.describe DiverGoal, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:diver_goal)).to be_valid
  end
end
