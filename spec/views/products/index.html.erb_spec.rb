require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      @product = assign(:product, Product.create!(name: 'name1', price: '9.99', quantity: 42)),
      @product = assign(:product, Product.create!(name: 'name2', price: '9.98', quantity: 43)),
    ])
  end

  it "renders a list of products" do
    render

    expect(rendered).to match /name1/
    expect(rendered).to match /name2/
  end

  it 'allows to add to cart' do
    render

    expect(rendered).to match(/shopping-cart/)
  end
end
