class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: [:show]
  def index
    @items = Item.all
  end
end
