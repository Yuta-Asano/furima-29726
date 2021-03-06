class AddressCredit

  include ActiveModel::Model
  attr_accessor :post_code, :city, :address, :building, :phone_number, :item_id, :user_id, :area_id, :token
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'にはハイフンが必要でないと登録できない' }
    validates :city
    validates :address
    validates :token
    validates :phone_number, numericality: { with: /\A\d{10,11}\z/, message: 'にはハイフンは不要で、10桁、11桁以内でないと登録できません' } 
  end
    with_options numericality: { other_than: 1, message: '"--"以外を選択してください'} do
      validates  :area_id
    end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    

    Address.create(post_code: post_code, city: city, address: address, building: building, area_id: area_id, phone_number: phone_number, order_id: order.id)



  end
end