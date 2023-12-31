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
        expect(@item.errors.full_messages).to include "商品画像を入力してください"
      end

      it 'item_name が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end

      it 'item_nameが40文字より大きければ登録できない' do
        @item.item_name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名は40文字以内で入力してください"
      end

      it 'description_itemが空では登録できない' do
        @item.description_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品説明を入力してください"
      end

      it 'description_itemが1000文字より大きければ登録できない' do
        @item.description_item = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include '商品説明は1000文字以内で入力してください'
      end

      it 'category_idが初期値では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを入力してください"
      end

      it 'condition_idが初期値では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を入力してください"
      end

      it 'shipping_charges_idが初期値では登録できない' do
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を入力してください"
      end

      it 'region_idが初期値では登録できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "地域を入力してください"
      end

      it 'number_of_dayが初期値では登録できない' do
        @item.number_of_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を入力してください"
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "価格を入力してください"
      end

      it 'priceが300未満では登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は300以上の値にしてください'
      end

      it 'priceが9999999より大きければ登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は9999999以下の値にしてください'
      end

      it 'priceは半角数字以外を含むとできない' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は数値で入力してください'
      end

      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '出品者の情報を入力してください'
      end
    end
  end
end
