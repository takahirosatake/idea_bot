require 'rails_helper'

RSpec.describe "CategoriesAPI", type: :request do
  it 'カテゴリーの登録' do
    params = FactoryBot.attributes_for(:category)
    post '/api/v1/categories', params: { category: params}
    # リクエスト成功を表す200が返ってきたか確認する。
    expect(response).to have_http_status(200)
  end
end
