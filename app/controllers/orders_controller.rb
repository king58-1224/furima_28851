class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only:[:index, :create, :order]
  before_action :order, only: [:index]
  
  def index
    @order = Order.new
    return redirect_to root_path if @item.item_purchase
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(
      :token,
      :postal_code, :prefecture_id,
      :muncipality, :block_number, :apartment_name,
      :phone_number, :item_id
    )
          .merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order
    redirect_to item_path(@item.id) if @item.user_id == current_user.id
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
