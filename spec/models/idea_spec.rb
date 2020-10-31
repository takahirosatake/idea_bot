require 'rails_helper'
RSpec.describe Idea, type: :model do
  before do 
    @idea = FactoryBot.create(:idea)
  end
  describe 'アイデアが登録できているか' do
    context '登録できている場合' do
      it "category_idとnameがあれば保存できる" do
        expect(@idea).to be_valid
      end
    end 
    context '登録できない場合' do
      it "category_idが空の場合、無効であること" do
        @idea.category = " "
        @idea.valid?
        expect(@idea.errors.full_messages).to include("category_id can't be blank")
      end
      it "bodyが空の場合、無効であること" do
        @idea.body = " "
        @idea.valid?
        expect(@idea.errors.full_messages).to include("body can't be blank")
      end
      it "body" do
         = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
    end
  end
end
