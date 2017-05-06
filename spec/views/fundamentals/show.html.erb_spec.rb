require 'rails_helper'

RSpec.describe "fundamentals/show", type: :view do
  before(:each) do
    @fundamental = assign(:fundamental, Fundamental.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
