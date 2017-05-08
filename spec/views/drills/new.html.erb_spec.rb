require 'rails_helper'

RSpec.describe "drills/new", type: :view do
  before(:each) do
    assign(:drill, Drill.new(
      :name => "MyString",
      :progression => 1,
      :skill => nil
    ))
  end

  it "renders new drill form" do
    render

    assert_select "form[action=?][method=?]", drills_path, "post" do

      assert_select "input#drill_name[name=?]", "drill[name]"

      assert_select "input#drill_progression[name=?]", "drill[progression]"

      assert_select "input#drill_skill_id[name=?]", "drill[skill_id]"
    end
  end
end
