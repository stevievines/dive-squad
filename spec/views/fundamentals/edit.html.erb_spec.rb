require 'rails_helper'

RSpec.describe "fundamentals/edit", type: :view do
  before(:each) do
    @fundamental = assign(:fundamental, Fundamental.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit fundamental form" do
    render

    assert_select "form[action=?][method=?]", fundamental_path(@fundamental), "post" do

      assert_select "input#fundamental_name[name=?]", "fundamental[name]"
    end
  end
end
