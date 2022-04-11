class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :content, :category_id, :status_id, :delivery_charge_id, :region_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
