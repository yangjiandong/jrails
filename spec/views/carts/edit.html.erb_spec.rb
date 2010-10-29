require 'spec_helper'

describe "carts/edit.html.erb" do
  before(:each) do
    @cart = assign(:cart, stub_model(Cart,
      :new_record? => false
    ))
  end

  it "renders the edit cart form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => cart_path(@cart), :method => "post" do
    end
  end
end
