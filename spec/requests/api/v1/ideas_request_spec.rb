require 'rails_helper'

RSpec.describe "IdeaAPI", type: :request do
  before do
    FactoryBot.create(:idea)
  end
  it '全てのアイデアを取得する' do
  
    get '/api/v1/ideas'
    json = JSON.parse(response.body)
    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response.status).to eq(200)
   
    # 正しい数のデータが返されたか確認する。
    expect(json['data'].length).to eq(1)
  end
  it 'category_nameが指定されている場合は該当するcategoryのideasの一覧を返却' do 

    get '/api/v1/ideas?category_name = '
  end
end
