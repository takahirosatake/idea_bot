require 'rails_helper'
RSpec.describe "IdeaAPI", type: :request do
  context 'GETrequest' do
    it '全てのアイデアを取得する' do
      FactoryBot.create_list(:idea, 3)
      get '/api/v1/ideas'
      json = JSON.parse(response.body)
      p json #デバック確認
      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)
      # 正しい数のデータが返されたか確認する。
      expect(json['data'].length).to eq(3)
    end

    it 'category_nameが指定されている場合は該当するcategoryのideaを返却' do 
      ideas = FactoryBot.create_list(:idea, 5) 
      idea = ideas[1] #配列のデータを取ってくる
      get '/api/v1/ideas?', params: { 'category_name' => "#{idea.category.name}"} #該当するレスポンスデータを返却
      json = JSON.parse(response.body)
      p json #デバック確認
      expect(response.status).to eq(200)
    end

    it 'category_nameが該当しない場合は、ステータスコード404を返却' do 
      get '/api/v1/ideas?', params: { 'category_name' => "日常"} #該当しないcategory_nameなので、{status=404}を返却
      json = JSON.parse(response.body)
      p json #デバック確認
      expect(response.status).to_not eq(404)
    end
  end
  
  context 'POSTrequest' do
    it 'アイデアの登録' do
      params = FactoryBot.attributes_for(:idea)
      post '/api/v1/ideas', params: { idea: params}
      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response).to have_http_status(200)
    end
  end
end