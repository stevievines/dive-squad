require 'rails_helper'

RSpec.describe Practice, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:practice)).to be_valid
  end
end
