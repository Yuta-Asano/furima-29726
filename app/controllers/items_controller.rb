class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
  end
  private

  def item_params
    params.require(:item).permit(:name, :price, :information :image).merge(user_id: current_user.id)
  end
end
