class StoreController < ApplicationController
  def index
    @products = Product.find_products_for_sale
  end

  def add_to_cart
    pr = Product.find(params[:id])
    logger.debug 'product:' + pr.title
    @cart = find_cart
    @cart.add_product(pr)
  end

  private
  def find_cart
    session[:cart] ||= Cart.new
  end
end
