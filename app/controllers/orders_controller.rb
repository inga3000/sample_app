class OrdersController < ApplicationController

  def index
  	redirect_to :controller => 'products', :action => 'index'
  end

  def show
  end

  def new
  end

  def create 
  end
  
end