class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: "Jungle", password: "book", except: [:index, :show]

  def show
    @product_amount = Product.count
    @category_amount = Category.count
  end
end
