require 'rails_helper'

RSpec.describe "drills/show", type: :view do
  before(:each) do
    @drill = assign(:drill, Drill.create!(
      :name => "Name",
      :progression => 1,
      :skill => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
  end
end
