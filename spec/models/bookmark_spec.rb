require 'rails_helper'
describe Bookmark do
  describe '#create' do

    context '保存できる場合' do
      it "user_idとcontent_idがあれば登録できる" do
        bookmark = build(:bookmark)
        expect(bookmark).to be_valid
      end
    end

    context '保存に失敗する場合' do
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
end



