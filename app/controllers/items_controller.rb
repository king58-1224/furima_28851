class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: [:show]
  def index
    @items = Item.all
  end

  def new 
    @items = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    
    params.require(:item).
    permit(
    :name, :image, :price, :description,
    :condition_id, :shipping_cost_id, 
    :shipping_days_id, :shipping_from_id, 
    :category_id ).
    merge(user_id: current_user.id)
  end
end
