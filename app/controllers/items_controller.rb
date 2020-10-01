class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.create(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :information, :image, :category_id, :status_id, :delivery_fee_id, :area_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
