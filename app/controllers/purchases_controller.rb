class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    if @item.purchase.present? || current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :region_id, :municipalities, :address_number, :building, :phone_number).merge(item_id: params[:item_id], token: params[:token], user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
