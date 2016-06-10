require 'rails_helper'

RSpec.describe Coach, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:coach)).to be_valid
  end
end
