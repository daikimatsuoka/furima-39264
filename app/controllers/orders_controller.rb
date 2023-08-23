class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @orders_address = OrdersAddress.new
  end

  def create
    @orders_address = OrdersAddress.create(order_params)
    if @orders_address.valid? 
      @orders_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:orders_address).permit(:postcode, :region_id, :municipalities, :address, :building, :telephone_number)
    .merge(user_id: current_user.id, item_id: item_id, order_id: order.id)
  end
end
