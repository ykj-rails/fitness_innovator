require 'rails_helper'

describe LikesController do
  let(:user) { create(:user) }
  let(:content) { create(:content) }
  describe 'POST #create' do
    let(:params) { { user_id: user.id, content_id: content.id, like: attributes_for(:like) } }
    subject { post :create, params: params }
    context 'ログインしている場合' do
      before do
        login user
      end

      it "アクション内で定義されている@contentの値が期待したものになるか" do
        subject
        expect(assigns(:content)).to eq content
      end

      it 'Likeモデルのレコードが1件追加される' do
        expect{ subject }.to change(Like, :count).by(1)
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
    let(:like) { bookmark = create(:like, content_id: content.id, user_id: user.id) }
    let(:params) { { user_id: user.id, id: like, like: attributes_for(:like) } }
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
        like.reload
        expect{ subject }.to change(Like, :count).by(-1)
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