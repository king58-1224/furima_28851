class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:update, :edit, :destroy, :show ]

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
  end

  
  def update
    if @item.update(item_params)
      redirect_to root_path    
    else
      render :edit
    end
  end


  def edit
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  
  private

  def set_item
    @item = Item.find(params[:id])
  end

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
