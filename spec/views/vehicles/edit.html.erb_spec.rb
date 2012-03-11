require 'spec_helper'

describe "vehicles/edit" do
  before(:each) do
    @vehicle = assign(:vehicle, stub_model(Vehicle,
      :name => "MyString",
      :highway => 1,
      :city => 1,
      :cost => 1.5,
      :notes => "MyText"
    ))
  end

  it "renders the edit vehicle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vehicles_path(@vehicle), :method => "post" do
      assert_select "input#vehicle_name", :name => "vehicle[name]"
      assert_select "input#vehicle_highway", :name => "vehicle[highway]"
      assert_select "input#vehicle_city", :name => "vehicle[city]"
      assert_select "input#vehicle_cost", :name => "vehicle[cost]"
      assert_select "textarea#vehicle_notes", :name => "vehicle[notes]"
    end
  end
end
