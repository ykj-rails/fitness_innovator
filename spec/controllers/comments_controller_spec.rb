require 'rails_helper'

describe CommentsController do
  let(:user) { create(:user) }
  let(:content) { create(:content) }
  describe 'POST #create' do
    let(:params) { { user_id: user.id, content_id: content.id, comment: attributes_for(:comment) } }
    subject { post :create, params: params }
    context 'ログインしている場合' do
      before do
        login user
      end

      it 'Commentモデルのレコードが1件追加される' do
        expect{ subject }.to change(Comment, :count).by(1)
      end

      it 'root_pathに遷移' do
        subject
        expect(response).to redirect_to(root_path)
      end
    end

    context 'ログインしていない場合' do
      it "root_pathに遷移" do
        subject
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:comment) { comment = create(:comment, content_id: content.id, user_id: user.id) }
    let(:params) { { user_id: user.id, content_id: content.id, id: comment, comment: attributes_for(:comment) } }
    subject { delete :destroy, params: params }
    context 'ログインしている場合' do
      before do
        login user
      end

      it "アクション内で定義されている@commentの値が期待したものになるか" do
        subject
        expect(assigns(:comment)).to eq comment
      end

      it 'user.idとcomment.user_idが等しいとCommentモデルのレコードが1件削除される' do
        comment.reload
        expect{ subject }.to change(Comment, :count).by(-1)
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