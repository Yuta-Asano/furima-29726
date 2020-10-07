class OrdersController < ApplicationController
  before_action :item_info, only: [:index, :create]

  def index
   if current_user.id == @items.user_id || item_info.order.nil?
      redirect_to root_path
   end
   @address_credit = AddressCredit.new
  end


  def create
    @address_credit = AddressCredit.new(order_params)
    if @address_credit.valid?
       credit_info
       @address_credit.save
       redirect_to root_path
    else
      render :index
    end
  end


  private
  def order_params
    params.require(:address_credit).permit(:post_code, :city, :area_id, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @items.id, token: params[:token])
  end

  def credit_info
    Payjp.api_key = "sk_test_25abcf5b31e5eee3c2c059b6"  
    Payjp::Charge.create(
      amount: @items.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

 def item_info
  @items = Item.find(params[:item_id])
 end

end


