require 'rails_helper'
describe Comment do
  describe '#create' do

    it "textがあれば登録できる" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "textが空だと登録できない" do
      comment = build(:comment, text: "")
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください。")
    end

  end
end
