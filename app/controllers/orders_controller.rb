class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid? 
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    item = Item.find(params[:item_id])

    params.require(:order_address).permit(:postcode, :region_id, :municipalities, :address, :building, :telephone_number)
    .merge(user_id: current_user.id, item_id: item.id, order_id: order.id)
  end
end
