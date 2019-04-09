require 'rails_helper'
describe User do

  describe '#create' do
    it "ユーザーネームのバリデーション" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000" )
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください。")
    end
  end

  describe '#create' do
    it "emailのバリデーション" do
      user = User.new(nickname: "yuki", email: "", password: "00000000" )
      user.valid?
      expect(user.errors[:email]).to include("を入力してください。")
    end
  end
end