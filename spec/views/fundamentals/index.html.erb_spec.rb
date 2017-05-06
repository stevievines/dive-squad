require 'rails_helper'

RSpec.describe "fundamentals/index", type: :view do
  before(:each) do
    assign(:fundamentals, [
      Fundamental.create!(
        :name => "Name"
      ),
      Fundamental.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of fundamentals" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
