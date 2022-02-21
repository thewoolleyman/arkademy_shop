# spec/requests/products_spec.rb

require 'rails_helper'

RSpec.describe '/products', type: :request do
  let(:valid_attributes) { { name: 'Sneakers', price: 49.99, quantity: 4 } }
  let(:invalid_attributes) { { name: '' } }

  before(:each) do
    user = User.create(admin: true, email: "email@user.pl", password: "123blabla345")
    sign_in(user)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Product.create! valid_attributes
      get products_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      product = Product.create! valid_attributes
      get product_url(product)
      expect(response).to be_successful
    end
  end
end
