require 'rails_helper'

RSpec.describe "skills/edit", type: :view do
  before(:each) do
    @skill = assign(:skill, Skill.create!(
      :name => "MyString",
      :fundamental => nil
    ))
  end

  it "renders the edit skill form" do
    render

    assert_select "form[action=?][method=?]", skill_path(@skill), "post" do

      assert_select "input#skill_name[name=?]", "skill[name]"

      assert_select "input#skill_fundamental_id[name=?]", "skill[fundamental_id]"
    end
  end
end
