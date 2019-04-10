require 'rails_helper'
describe User do
  describe '#create' do

    context '保存できる場合' do
      it "nickname、email、passwordが正常であれば登録できる" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "nicknameが25文字以下であれば登録できる" do
        user = build(:user, nickname: "そうですこの文字は25文字丁度に設定されています。" )
        expect(user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        user = build(:user, password: "123456" )
        expect(user).to be_valid
      end
    end

    context '保存に失敗する場合' do
      it "nicknameが空なら登録できない" do
        user = build(:user, nickname: "" )
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください。")
      end

      it "nicknameが26文字以上であれば登録できない" do
        user = build(:user, nickname: "そうですこの文字は26文字丁度に設定されていますよ。" )
        user.valid?
        expect(user.errors[:nickname]).to include("は25文字以下に設定して下さい。")
      end

      it "emailが空なら登録できない" do
        user = build(:user, email: "" )
        user.valid?
        expect(user.errors[:email]).to include("を入力してください。")
      end

      it "emailが重複していると登録できない" do
        user = create(:user)
        another_user = build(:user, email: user[:email] )
        another_user.valid?
        expect(another_user.errors[:email]).to include("は既に使用されています。")
      end

      it "passwordが空なら登録できない" do
        user = build(:user, password: "" )
        user.valid?
        expect(user.errors[:password]).to include("を入力してください。")
      end

      it "passwordが5文字以下なら登録できない" do
        user = build(:user, password: "12345" )
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
      end
    end

  end
end

