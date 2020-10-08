require 'rails_helper'

RSpec.describe AddressCredit, type: :model do
  describe '商品購入機能' do
    before do
      @address_credit = FactoryBot.build(:address_credit)
    end
    describe '購入機能' do
      it 'post_codeは空だと登録出来ない' do
        @address_credit.post_code = nil
        @address_credit.valid?
        expect(@address_credit.errors.full_messages).to include("Post code can't be blank")
      end
      it 'cityが空だと登録できない' do
        @address_credit.city = nil
        @address_credit.valid?
        expect(@address_credit.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では登録できない' do
        @address_credit.address = nil
        @address_credit.valid?
        expect(@address_credit.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
        @address_credit.phone_number = nil
        @address_credit.valid?
        expect(@address_credit.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'area_idが1だと登録できない' do
        @address_credit.area_id = 1
        @address_credit.valid?
        expect(@address_credit.errors.full_messages).to include('Area must be other than 1')
      end
      it 'post_codeはハイフンが含まれてないと登録できない' do
        @address_credit.post_code = '1234567'
        @address_credit.valid?
        expect(@address_credit.errors.full_messages).to include('Post code Input correctly')
      end
      it 'phone_numberはハイフンは不要で、11桁以内でないと登録できない' do
        @address_credit.phone_number = '999-9999-9999'
        @address_credit.valid?
        expect(@address_credit.errors.full_messages).to include('Phone number Input only number')
      end
      it 'tokenがないと登録できない' do
          @address_credit.token = nil
          @address_credit.valid?
          expect(@address_credit.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

