require 'rails_helper'

RSpec.describe "fundamentals/new", type: :view do
  before(:each) do
    assign(:fundamental, Fundamental.new(
      :name => "MyString"
    ))
  end

  it "renders new fundamental form" do
    render

    assert_select "form[action=?][method=?]", fundamentals_path, "post" do

      assert_select "input#fundamental_name[name=?]", "fundamental[name]"
    end
  end
end
