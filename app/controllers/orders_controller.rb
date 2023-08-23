class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order_address = OrderAddress.new
  end

  def create
    item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params(item))
    if @order_address.valid? 
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params(item)
    params.require(:order_address).permit(:postcode, :region_id, :municipalities, :address, :building, :telephone_number)
    .merge(user_id: current_user.id, item_id: item.id )
  end
end
