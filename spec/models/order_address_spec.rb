require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingは空でも保存できる' do
        building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeがなければ保存できない' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "郵便番号を入力してください"
      end

      it 'postcode3桁ハイフン4桁の半角文字列でなければ保存できない' do
        @order_address.postcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '郵便番号が無効です。ハイフン（-）を含めてください'
      end

      it 'region_idが初期値では保存できない' do
        @order_address.region_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "都道府県を入力してください"
      end

      it 'municipalitiesが空では保存できない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "市区町村を入力してください"
      end

      it 'addressが空では保存できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "番地を入力してください"
      end

      it 'telephone_numberが空では保存できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号を入力してください"
      end

      it 'telephone_numberが9桁以下では保存できない' do
        @order_address.telephone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は11桁以下である必要があります'
      end

      it 'telephone_numberは12桁以上では保存できない' do
        @order_address.telephone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は11桁以下である必要があります'
      end

      it 'telephone_numberは半角数値以外では登録できない' do
        @order_address.telephone_number = '090-1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include '電話番号は不正な値です'
      end

      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "クレジットカード情報を入力してください"
      end

      it 'userが紐付いていないと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "購入者の情報を入力してください"
      end

      it 'itemが紐付いていないと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "商品情報を入力してください"
      end
    end
  end
end
