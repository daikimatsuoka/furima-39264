class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description_item, :category_id, :condition_id, :shipping_charges_id, :region_id,
                                 :number_of_day_id, :price, :item_image).merge(user_id: current_user.id)
  end
end
