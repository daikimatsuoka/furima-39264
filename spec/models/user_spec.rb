require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー管理機能' do
    context '新規登録できるとき' do
      it 'nickname,email,password,passwprd_confirmation,surname,first_name,surname_kana,first_name_kana,date_of_birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do 
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do 
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '既に登録されているemailでは登録できない' do 
        @user.save
        author_user = FactoryBot.build(:user)
        author_user.email = @user.email
        author_user.valid?
        expect(author_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailは@を含まないと登録できない' do 
        @user.email = 'testexample'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが空では登録できない' do 
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'test1'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordが129文字以上では登録できない' do 
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too long (maximum is 128 characters)"
      end
      it 'passwordは半角英字のみでは登録できない' do 
        @user.password = 'testte'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include  "Password is invalid"
      end
      it 'passwordは半角英数字のみでは登録できない' do 
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include  "Password is invalid"
      end
      it 'passwordは全角文字を含むと登録できない' do 
        @user.password = 'ｔest01'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include  "Password is invalid"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do 
        @user.password = 'test02'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'surnameが空では登録できない' do 
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Surname can't be blank"
      end
      it 'first_nameが空では登録できない' do 
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'surnameは半角文字を含むと登録できない' do 
        @user.surname = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Surname is invalid"
      end
      it 'first_nameは半角文字を含むと登録できない' do 
        @user.first_name = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it 'surname_kanaが空では登録できない' do 
        @user.surname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Surname kana can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do 
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'surname_kanaが全角カナ以外では登録できない' do 
        @user.surname_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include "Surname kana is invalid"
      end
      it 'first_name_kanaが全角カナ以外では登録できない' do 
        @user.first_name_kana = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it 'date_of_birthが空では登録できない' do 
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Date of birth can't be blank"
      end
    end
  end
end
