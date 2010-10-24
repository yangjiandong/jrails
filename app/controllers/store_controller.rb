class StoreController < ApplicationController
  
  before_filter :find_cart, :except => :empty_cart
  
  def index
    # jruby --debug -S script/server --debugger
    #require "rubygems"
    #require "ruby-debug"
    #debugger
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
      format.js if request.xhr?
      # 如果浏览器不支持 javascript
      format.html {redirect_to_index}
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    redirect_to_index("Invalid product")
  end

  def empty_cart
    session[:cart] = nil
    #redirect_to_index("Your cart is currently empty")
    redirect_to_index
  end

  def checkout
    @cart = find_cart
    if @cart.items.empty?
      logger.debug "--> Your cart is empty "
      redirect_to_index("Your cart is empty")
    else
      logger.debug "--> checkout order new. "
      @order=Order.new
    end
  end

  def save_order
    @cart = find_cart
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    if @order.save
      session[:cart] = nil
      redirect_to_index("Thank you for your order")
    else
      render :action => 'checkout'
    end
  end

  private
  def find_cart
    @cart = (session[:cart] ||= Cart.new)
  end

  def redirect_to_index(msg=nil)
    flash[:notice] = msg if msg
    redirect_to :action => "index"
  end
end
