class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end
  private

  def item_params
    params.require(:item).permit(:name, :price, :information, :image).merge(user_id: current_user.id)
  end
end
