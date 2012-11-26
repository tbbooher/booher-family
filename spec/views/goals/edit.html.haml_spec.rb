require 'spec_helper'

describe "goals/edit" do
  before(:each) do
    @goal = assign(:goal, stub_model(Goal,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit goal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => goals_path(@goal), :method => "post" do
      assert_select "input#goal_name", :name => "goal[name]"
      assert_select "textarea#goal_description", :name => "goal[description]"
    end
  end
end
