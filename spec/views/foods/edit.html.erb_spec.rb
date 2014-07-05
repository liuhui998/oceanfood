require 'spec_helper'

describe "foods/edit" do
  before(:each) do
    @food = assign(:food, stub_model(Food,
      :name => "MyString",
      :price => "9.99",
      :memo => "MyString",
      :image => "MyString"
    ))
  end

  it "renders the edit food form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", food_path(@food), "post" do
      assert_select "input#food_name[name=?]", "food[name]"
      assert_select "input#food_price[name=?]", "food[price]"
      assert_select "input#food_memo[name=?]", "food[memo]"
      assert_select "input#food_image[name=?]", "food[image]"
    end
  end
end
