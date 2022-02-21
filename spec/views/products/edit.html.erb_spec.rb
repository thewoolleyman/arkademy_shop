require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(name: 'name', price: '9.99', quantity: 42))
  end

  it "renders the edit product form" do
    render

    expect(rendered).to match /products/
    expect(rendered).to match /submit/
    expect(rendered).to match /name/
    expect(rendered).to match /quantity/
    expect(rendered).to match /price/
    expect(rendered).to match /9.99/
    expect(rendered).to match /42/
  end
end
