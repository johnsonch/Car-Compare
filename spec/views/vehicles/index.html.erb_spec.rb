require 'spec_helper'

describe "vehicles/index" do
  before(:each) do
    assign(:vehicles, [
      stub_model(Vehicle,
        :name => "Name",
        :highway => 1,
        :city => 1,
        :cost => 1.5,
        :notes => "MyText"
      ),
      stub_model(Vehicle,
        :name => "Name",
        :highway => 1,
        :city => 1,
        :cost => 1.5,
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of vehicles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
