require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }
  let(:content) { create(:content) }

  describe 'GET #show' do
    subject { get :show, params: { id: user } }
    it "アクション内で定義されている@userの値が期待したものになるか" do
      subject
      expect(assigns(:user)).to eq user
    end

    it "アクション内で定義されているcreated_at DESCでソートされた配列@contentsの値が期待したものになるか" do
      contents = create_list(:content, 3, user_id: user.id)
      subject
      expect(assigns(:contents)).to match(contents.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "show.html.erbに遷移" do
      subject
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    subject { get :edit, params: { id: user } }
    context 'ログインしている場合' do
      before do
        login user
      end

      it "アクション内で定義されている@userの値が期待したものになるか" do
        subject
        expect(assigns(:user)).to eq user
      end

      it "edit.html.erbに遷移" do
        subject
        expect(response).to render_template :edit
      end
    end

    context 'ログインしていない場合' do
      it "sessions/new.html.erbに遷移" do
        subject
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PATCH #update' do
    let(:params)  { { id: user, user: attributes_for(:user, profile: 'アップデートテスト') } }
    subject { patch :update, params: params }
    context 'ログインしている場合' do
      before do
        login user
      end

      context '更新に成功した場合' do
        it "アクション内で定義されている@userの値が期待したものになるか" do
          subject
          expect(assigns(:user)).to eq user
        end

        it 'user.idとログインしているユーザーidが等しいと値が更新される' do
          subject
          user.reload
          expect(user.profile).to eq("アップデートテスト")
        end

        it 'user_pathに遷移' do
          subject
          expect(response).to redirect_to(user_path(user))
        end
      end

      context '更新に失敗した場合' do
        let(:invalid_params) { { id: user, user: attributes_for(:user, profile: nil) } }

        it 'user_pathに遷移' do
          patch :update, params: invalid_params
          expect(response).to redirect_to(user_path(user))
        end
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