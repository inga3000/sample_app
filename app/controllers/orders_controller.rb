class OrdersController < ApplicationController
  #before_action :set_order, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate_user!
  load_and_authorize_resource

  def index
  	@order = Order.all
  end

  def show  	
  end

  def new
  end

  def create 
  end
  
end