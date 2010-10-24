#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class InfoController < ApplicationController

  # hand create xml
  def who_bought
    @product = Product.find(params[:id])
    @orders  = @product.orders
    respond_to do |format|
      # 可用于html，xml 输出
      format.html
      format.xml { render :layout => false }
    end
  end

  # auto create
  def who_bought_auto
    @product = Product.find(params[:id])
    @orders  = @product.orders
    respond_to do |format|
      # 可用于html，xml 输出
      format.html
      format.xml { render :layout => false ,
        :xml => @product.to_xml(:include=>:orders)}
    end
  end

  # feed
  def who_bought_atom
    @product = Product.find(params[:id])
    @orders  = @product.orders
    respond_to do |format|
      # 可用于html，xml 输出
      format.html
      format.atom { render :layout => false }
    end
  end

  # json
  def who_bought_json
    @product = Product.find(params[:id])
    @orders  = @product.orders
    respond_to do |format|
      # 可用于html，xml 输出
      format.html
      format.json { render :layout => false ,
        :json => @product.to_json(:include=>:orders)}
    end
  end

  protected

  def authorize
  end
end