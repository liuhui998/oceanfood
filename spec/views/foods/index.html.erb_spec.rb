require 'spec_helper'

describe "foods/index" do
  before(:each) do
    assign(:foods, [
      stub_model(Food,
        :name => "Name",
        :price => "9.99",
        :memo => "Memo",
        :image => "Image"
      ),
      stub_model(Food,
        :name => "Name",
        :price => "9.99",
        :memo => "Memo",
        :image => "Image"
      )
    ])
  end

  it "renders a list of foods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Memo".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
