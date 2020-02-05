class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)# Use model Product to call DB
  end

  def show
    @product = Product.find params[:id]
  end

end
