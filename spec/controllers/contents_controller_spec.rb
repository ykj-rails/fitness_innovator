require 'rails_helper'

describe ContentsController do
  let(:user) { create(:user) }

  describe 'GET #index' do
    it "created_at DESCでソートされた配列@contentsの値を確認" do
      contents = create_list(:content, 3)
      get :index
      expect(assigns(:contents)).to match(contents.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "@commentがインスタンスかつ未保存のレコードか確認" do
      get :index
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it "index.html.erbに遷移" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:content) { content = create(:content) }

    it "変数@contentの値を確認" do
      get :show, params: { id: content }
      expect(assigns(:content)).to eq content
    end

    it "@commentがインスタンスかつ未保存のレコードか確認" do
      get :show, params: { id: content }
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it "show.html.erbに遷移" do
      get :show, params: { id: content }
      expect(response).to render_template :show
    end
  end

  describe 'GET #comments_show' do
    let(:content) { content = create(:content) }

    it "変数@contentの値を確認" do
      get :comments_show, params: { id: content }
      expect(assigns(:content)).to eq content
    end

    it "@commentがインスタンスかつ未保存のレコードか確認" do
      get :comments_show, params: { id: content }
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it "show.html.erbに遷移" do
      get :comments_show, params: { id: content }
      expect(response).to render_template :comments_show
    end
  end

  describe 'GET #new' do
    context 'ログインしている場合' do
      before do
        login user
        get :new
      end

      it "@contentがインスタンスかつ未保存のレコードか確認" do
        expect(assigns(:content)).to be_a_new(Content)
      end

      it "new.html.erbに遷移" do
        expect(response).to render_template :new
      end
    end

    context 'ログインしていない場合' do
      it "sessions/new.html.erbに遷移" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #edit' do
    context 'ログインしている場合' do
      let(:content) { content = create(:content) }
      before do
        login user
      end

      it "edit.html.erbに遷移" do
        get :edit, params: { id: content }
        expect(response).to render_template :edit
      end

      it "変数@contentの値を確認" do
        get :edit, params: { id: content }
        expect(assigns(:content)).to eq content
      end
    end

    context 'ログインしていない場合' do
      it "sessions/new.html.erbに遷移" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    let(:params) { { user_id: user.id, content: attributes_for(:content) } }
    context 'ログインしている場合' do
      before do
        login user
      end

      context '保存に成功した場合' do
        subject { post :create, params: params }

        it 'Contentモデルのレコードが1件追加される' do
          expect{ subject }.to change(Content, :count).by(1)
        end

        it 'root_pathに遷移' do
          subject
          expect(response).to redirect_to(root_path)
        end
      end

      context '保存に失敗した場合' do
        let(:invalid_params) { { user_id: user.id, content: attributes_for(:content, period: nil, before_body_weight: nil) } }
        subject { post :create, params: invalid_params }

        it "Contentモデルのレコードが追加されない" do
          expect{ subject }.not_to change(Content, :count)
        end

        it 'root_pathに遷移' do
          subject
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context 'ログインしていない場合' do
      it "sessions/new.html.erbに遷移" do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PATCH #update' do
    let(:content) { content = create(:content, user_id: user.id) }
    let(:params)  { { id: content, content: attributes_for(:content, period: '2ヶ月', comment: 'アップデートテスト') } }
    context 'ログインしている場合' do
      before do
        login user
      end

      context '更新に成功した場合' do
        subject { patch :update, params: params }
        it "@contentの値を確認" do
          subject
          expect(assigns(:content)).to eq content
        end

        it 'user.idとcontent.user.idが等しいと値が更新される' do
          subject
          content.reload
          expect(content.period).to eq("2ヶ月")
          expect(content.comment).to eq("アップデートテスト")
        end

        it 'content_pathに遷移' do
          subject
          expect(response).to redirect_to(content_path(content))
        end
      end

      context '更新に失敗した場合' do
        let(:invalid_params) { { user_id: user.id, id: content, content: attributes_for(:content, period: nil) } }
        subject { patch :update, params: invalid_params }

        it 'content_pathに遷移' do
          subject
          expect(response).to redirect_to(content_path(content))
        end
      end
    end

    context 'ログインしていない場合' do
      it "sessions/new.html.erbに遷移" do
        patch :update, params: { id: content }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:content) { content = create(:content, user_id: user.id) }
    let(:params) { { id: content, content: attributes_for(:content) } }
    context 'ログインしている場合' do
      before do
        login user
      end

      context '削除に成功した場合' do
        subject { delete :destroy, params: params }
        it "@contentの値を確認" do
          subject
          expect(assigns(:content)).to eq content
        end

        it 'user.idとcontent.user.idが等しいと削除される' do
          content.reload
          expect{ subject }.to change(Content, :count).by(-1)
        end

        it 'root_pathに遷移' do
          subject
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context 'ログインしていない場合' do
      it "sessions/new.html.erbに遷移" do
        delete :destroy, params: { id: content }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end