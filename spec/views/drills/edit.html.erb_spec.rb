require 'rails_helper'

RSpec.describe "drills/edit", type: :view do
  before(:each) do
    @drill = assign(:drill, Drill.create!(
      :name => "MyString",
      :progression => 1,
      :skill => nil
    ))
  end

  it "renders the edit drill form" do
    render

    assert_select "form[action=?][method=?]", drill_path(@drill), "post" do

      assert_select "input#drill_name[name=?]", "drill[name]"

      assert_select "input#drill_progression[name=?]", "drill[progression]"

      assert_select "input#drill_skill_id[name=?]", "drill[skill_id]"
    end
  end
end
