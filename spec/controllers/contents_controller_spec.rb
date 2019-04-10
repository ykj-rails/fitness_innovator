require 'rails_helper'

describe ContentsController do

  describe 'GET #index' do
    it "created_at DESCでソートされた配列@contentsの値を確認" do
      contents = create_list(:content, 3)
      get :index
      expect(assigns(:contents)).to match(contents.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "index.html.erbに遷移" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "new.html.erbに遷移" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "edit.html.erbに遷移" do
      content = create(:content)
      get :edit, params: { id: content }
      expect(response).to render_template :edit
    end

    it "変数@contentの値を確認" do
      content = create(:content)
      get :edit, params: { id: content }
      expect(assigns(:content)).to eq content
    end
  end

end