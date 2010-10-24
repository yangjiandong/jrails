#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class AdminController < ApplicationController

  # just display the form and wait for user to
  # enter a name and password

  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || {:action => "index"})
      else
        flash.now[:notice] = "用户名或密码不对!"
      end
    end
  end



  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end



  def index
    @total_orders = Order.count
#    require "rubygems"
#    require "ruby-debug"
#    debugger

  end

end