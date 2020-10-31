require 'rails_helper'

RSpec.describe Category, type: :model do
  before do 
    @category = FactoryBot.build(:category)
  end
  describe 'カテゴリーが登録できているか' do
    context '登録できている場合' do
      it "nameがあれば保存できる" do
        expect(@category).to be_valid
      end
    end 
    context '登録できない場合' do
      it "nameが空の場合、無効であること" do
        @category.name = " "
        @category.valid?
        expect(@category.errors.full_messages).to include("category can't be blank")
      end

      it "重複したemailが存在する場合登録できないこと" do
        #はじめにユーザーを登録
        user = create(:user)
        #先に登録したユーザーと同じemailの値を持つユーザーのインスタンスを作成
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
    end
  end
end
