require 'rails_helper'
describe Bookmark do
  describe '#create' do

    it "user_idとcontent_idがあれば登録できる" do
      bookmark = build(:bookmark)
      expect(bookmark).to be_valid
    end

    it "user_idが空だと登録できない" do
      bookmark = build(:bookmark, user_id: "")
      bookmark.valid?
      expect(bookmark.errors[:user_id]).to include("を入力してください。")
    end

    it "content_idが空だと登録できない" do
      bookmark = build(:bookmark, content_id: "")
      bookmark.valid?
      expect(bookmark.errors[:content_id]).to include("を入力してください。")
    end

  end
end



