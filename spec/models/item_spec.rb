require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を出品できるとき' do
      it 'item_image,item_name.description_item,category_id,condition_id,shipping_charges_id,region_id,number_of_day_id,price_idが正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できないとき' do
      it 'item_image が空では登録できない' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item image can't be blank"
      end

      it 'item_name が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include  "Item name can't be blank"
      end

      it 'item_nameが40文字より大きければ登録できない' do
        @item.item_name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name is too long (maximum is 40 characters)"
      end

      it 'description_itemが空では登録できない' do
        @item.description_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description item can't be blank"
      end

      it 'description_itemが1000文字より大きければ登録できない' do
        @item.description_item = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include "Description item is too long (maximum is 1000 characters)"
      end

      it 'category_idが初期値では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include  "Category can't be blank"
      end

      it 'condition_idが初期値では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it 'shipping_charges_idが初期値では登録できない' do
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charges can't be blank"
      end

      it 'region_idが初期値では登録できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Region can't be blank"
      end

      it 'number_of_dayが初期値では登録できない' do
        @item.number_of_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Number of day can't be blank"
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it 'priceが300未満では登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it 'priceが9999999より大きければ登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

      it 'priceは半角数字以外を含むとできない' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end  

      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
