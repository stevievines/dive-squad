require 'rails_helper'

RSpec.describe ListDive, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:list_dive)).to be_valid
  end
end
