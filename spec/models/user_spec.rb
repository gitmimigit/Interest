require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end
  context '新規登録できるとき' do
    it 'user_nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it 'user_nameが空では登録できない' do
      @user.user_name =""
      @user.valid?
      expect(@user.errors.full_messages).to include "名前を入力してください"
    end
    it 'emailが空では登録できない' do
      @user.email =""
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールを入力してください"
    end
    it 'passwordが空では登録できない' do
      @user.password =""
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードを入力してください"
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password ="000008"
      @user.password_confirmation ="000009"
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
    end
    it 'user_nameが9文字以上では登録できない' do
      @user.user_name ="abcdefghi"
      @user.valid?
      expect(@user.errors.full_messages).to include "名前は8文字以内で入力してください"
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Eメールはすでに存在します"
    end
    it 'emailは@を含まないと登録できない' do
      @user.email ="aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Eメールは不正な値です"
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password ="0008"
      @user.password_confirmation =@user.password
      @user.valid?
      expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include "パスワードは128文字以内で入力してください"
    end
  end
end
