require 'rails_helper'

RSpec.describe User, type: :model do
 describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
   describe 'ユーザー新規登録' do
     it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "emailが一意性でないと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
     it "emailに@が含まれていないとユーザー登録できない" do
      @user.email = "a123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      
     end
     it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "passwordは６文字以上ではないと登録できない" do
      @user.password = "a123456"
      @user.password_confirmation = "a123456"
      expect(@user).to be_valid
     end
     it "passwordは半角英数字混合でないと登録できない" do
      @user.password = "a123456"
      @user.password_confirmation = "a123456"
      expect(@user).to be_valid
     end
     it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
     end
     it "first_nameが全角の漢字・ひらがな・カタカナで入力しないと登録できない" do
      @user.first_name = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
     end
     it "last_nameが全角の漢字・ひらがな・カタカナで入力しないと登録できない" do
      @user.last_name = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
     end
     it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end
     it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end
     it "first_name_kanaはフリガナで全角（カタカナ）で入力しないと登録できない" do
      @user.first_name_kana = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
     end
     it "last_name_kanaフリガナで全角（カタカナ）で入力しないと登録できない" do
      @user.last_name_kana = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
     end
     it "生年月日が空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
   end
  end
end
