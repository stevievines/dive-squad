require 'rails_helper'

RSpec.describe "drills/index", type: :view do
  before(:each) do
    assign(:drills, [
      Drill.create!(
        :name => "Name",
        :progression => 1,
        :skill => nil
      ),
      Drill.create!(
        :name => "Name",
        :progression => 1,
        :skill => nil
      )
    ])
  end

  it "renders a list of drills" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
