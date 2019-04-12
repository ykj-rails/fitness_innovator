require 'rails_helper'

describe BookmarksController do
  let(:user) { create(:user) }
  let(:content) { create(:content) }
  describe 'POST #create' do
    let(:params) { { user_id: user.id, content_id: content.id, bookmark: attributes_for(:bookmark) } }
    subject { post :create, params: params }
    context 'ログインしている場合' do
      before do
        login user
      end

      it "アクション内で定義されている@contentの値が期待したものになるか" do
        subject
        expect(assigns(:content)).to eq content
      end

      it 'Bookmarkモデルのレコードが1件追加される' do
        expect{ subject }.to change(Bookmark, :count).by(1)
      end

      it 'root_pathに遷移' do
        subject
        expect(response).to redirect_to(root_path)
      end
    end

    context 'ログインしていない場合' do
      it "sessions/new.html.erbに遷移" do
        subject
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:bookmark) { bookmark = create(:bookmark, content_id: content.id, user_id: user.id) }
    let(:params) { { user_id: user.id, id: bookmark, bookmark: attributes_for(:bookmark) } }
    subject { delete :destroy, params: params }
    context 'ログインしている場合' do
      before do
        login user
      end

      it "アクション内で定義されている@contentの値が期待したものになるか" do
        subject
        expect(assigns(:content)).to eq content
      end

      it 'Bookmarkモデルのレコードが1件削除される' do
        bookmark.reload
        expect{ subject }.to change(Bookmark, :count).by(-1)
      end

      it 'root_pathに遷移' do
        subject
        expect(response).to redirect_to(root_path)
      end
    end

    context 'ログインしていない場合' do
      it "sessions/new.html.erbに遷移" do
        subject
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end