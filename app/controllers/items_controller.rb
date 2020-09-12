class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  
  def update
    @item = Item.find(params[:id])
    if current_user.update(user_params)
      redirect_to root_path    
    else
      render :edit
    end
  end


  def edit
    @item = Item.find(params[:id])
  end

  
  private

  def item_params
    params.require(:item)
          .permit(
            :name, :image, :price, :description,
            :condition_id, :shipping_cost_id,
            :shipping_days_id, :shipping_from_id,
            :category_id
          )
          .merge(user_id: current_user.id)
  end
end
