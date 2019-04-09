require 'rails_helper'
describe Like do
  describe '#create' do

    it "user_idとcontent_idがあれば登録できる" do
      like = build(:like)
      expect(like).to be_valid
    end

    it "user_idが空だと登録できない" do
      like = build(:like, user_id: "")
      like.valid?
      expect(like.errors[:user_id]).to include("を入力してください。")
    end

    it "content_idが空だと登録できない" do
      like = build(:like, content_id: "")
      like.valid?
      expect(like.errors[:content_id]).to include("を入力してください。")
    end

  end
end



