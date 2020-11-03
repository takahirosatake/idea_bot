require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'カテゴリーが登録できているか' do
    context '登録できている場合' do
      it "nameがあれば保存できる" do
        category = build(:category)
        expect(category).to be_valid
      end
    end 
    context '登録できない場合' do
      it "nameが空の場合、無効であること" do
        category = build(:category, name: nil)
        expect(category).to_not be_valid
      end

      it "重複したnameが存在する場合登録できないこと" do
        category1 = create(:category)
        category = build(:category, name: category1.name)
        expect(category).to_not be_valid
      end
    end
  end
end
