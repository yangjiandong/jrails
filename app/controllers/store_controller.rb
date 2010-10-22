class StoreController < ApplicationController
  def index
    @products = Product.find_products_for_sale
    @cart = find_cart
  end

  def add_to_cart
    pr = Product.find(params[:id])
    logger.debug 'product:' + pr.title
    @cart = find_cart
    @current_item = @cart.add_product(pr)
    #页面直接跳转
    #redirect_to_index

    #rjs 页面无闪刷新 add_to_cart.js.rjs
    respond_to do |format|
      format.js
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    redirect_to_index("Invalid product")
  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index("Your cart is currently empty")
  end

  private
  def find_cart
    session[:cart] ||= Cart.new
  end

  def redirect_to_index(msg=nil)
    flash[:notice] = msg if msg
    redirect_to :action => "index"
  end
end