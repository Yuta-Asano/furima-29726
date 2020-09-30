require 'rails_helper'

RSpec.describe Item, type: :model do
 describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
   describe '出品機能' do
     it "nameが空だと登録できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
     end
     it "informationが空では登録できない" do
      @item.information = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Information can't be blank")
     end

     it "priceが空だと登録できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
     end
     
     it "area_idが--だと登録できない" do
      @item.area_id = "--"
      @item.valid?
      expect(@item.errors.full_messages).to include("Area is not a number")
     end
     it "category_idが--だと登録できない" do
      @item.category_id = "--"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
     end
     it "delivery_fee_idが--だと登録できない" do
      @item.delivery_fee_id = "--"
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee is not a number")
     end
     it "shipping_date_idが--だと登録できない" do
      @item.shipping_date_id = "--"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date is not a number")
     end
     it "priceは半角数字で入力しないと登録できない" do
      # binding.pry
      @item.price = "aaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
     end
     it "priceは300円〜9999999円の範囲でしか設定できない" do
      @item.price = "9999999999999999"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
     end
     it "statusが--だと登録できない" do
      @item.status_id = "--"
      @item.valid?
      expect(@item.errors.full_messages).to include("Status is not a number")
     end
   end
  end
end
