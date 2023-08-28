require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do 
        expect(@order_address).to be_valid
      end

      it 'buildingは空でも保存できる' do 
        building = ""
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeがなければ保存できない' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postcode can't be blank"
      end

      it 'postcode3桁ハイフン4桁の半角文字列でなければ保存できない' do
        @order_address.postcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postcode is invalid. Include hyphen(-)"
      end

      it 'region_idが初期値では保存できない' do
        @order_address.region_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Region can't be blank"
      end

      it 'municipalitiesが空では保存できない' do
        @order_address.municipalities = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Municipalities can't be blank"
      end

      it 'addressが空では保存できない' do
        @order_address.address = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end

      it 'telephone_numberが空では保存できない' do
        @order_address.telephone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Telephone number can't be blank"
      end

      it 'telephone_numberは10桁以上11桁以内でなければ保存できない' do
        @order_address.telephone_number = "090123456"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Telephone number Telephone number must be less than or equal to 11"
      end

      it 'telephone_numberは半角数値以外では登録できない' do
        @order_address.telephone_number = "090-1234-567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Telephone number is invalid"
      end
      
      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
