module Admin
  class HomeController < Admin::BaseController

    def admin
      render :admin
    end
    
    def index
      @products = Product.all
      @users_count = User.all.size
      @products_count = Product.all.size
      render :index, locals: { users_count: @users_count, products_count: @products_count }
    end
  end
end
