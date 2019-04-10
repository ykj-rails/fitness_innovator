require 'rails_helper'
describe Comment do
  describe '#create' do

    context '保存できる場合' do
      it "textがあれば登録できる" do
        comment = build(:comment)
        expect(comment).to be_valid
      end
    end

    context '保存に失敗する場合' do
      it "textが空だと登録できない" do
        comment = build(:comment, text: "")
        comment.valid?
        expect(comment.errors[:text]).to include("を入力してください。")
      end
    end

  end
end
