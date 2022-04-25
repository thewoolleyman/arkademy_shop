require 'rails_helper'

RSpec.describe '/carts', type: :request do
  let(:user) { User.create(admin: false, email: "email@admin.pl", password: "123blabla345") }

  before(:each) do
    sign_in(user)
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      cart = Cart.create!
      get cart_url(cart)
      expect(response).to be_successful
    end
  end

  describe 'PATCH /update' do
    it 'renders a successful response' do
      cart = Cart.create!
      product_item = ProductItem.create(name: 'test')
      patch cart_url(id: cart.id, product_item: product_item, add: true, subtract: false)
      expect(response).to be_successful
      expect(cart.reload.product_items.first).to eq product_item
    end
  end

  describe 'DELETE /destroy' do
    it 'renders a successful response' do
      cart = Cart.create!(user: user)
      product = Product.create!(name: 'name', price: '9.99', quantity: 42)
      ProductItem.create!(name: 'test', product: product, cart: cart)
      delete cart_url(cart.id)
      expect(cart.reload.product_items.size.zero?).to eq true
    end
  end
end