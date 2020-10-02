class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def destroy
    if @items.destroy
      redirect_to root_path
    end
  end

  def update
    if @items.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :information, :image, :category_id, :status_id, :delivery_fee_id, :area_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @items = Item.find(params[:id])
  end

end
