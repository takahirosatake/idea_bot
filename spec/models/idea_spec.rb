require 'rails_helper'
RSpec.describe Idea, type: :model do
  describe 'アイデアが登録できているか' do
    context '登録できている場合' do
      it "category_idとbodyがあれば保存できる" do
        idea = build(:idea)
        expect(idea).to be_valid
      end
    end 
    context '登録できない場合' do
      it "category_idが空の場合、無効であること" do
        idea = build(:idea, category_id: nil)
        expect(idea).to_not be_valid
      end
      it "bodyが空の場合、無効であること" do
        idea = build(:idea, body: nil)
        expect(idea).to_not be_valid
      end
    end
  end
end
