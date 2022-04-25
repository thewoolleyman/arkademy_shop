class CartsController < ApplicationController

  def update

  end

  def destroy
    cart.product_items.destroy_all
    redirect_to products_path
  end

  def show

  end


  private

  def cart
    @cart ||= user_signed_in? ? current_user.cart : Cart.find_by(params[:id])
  end
end