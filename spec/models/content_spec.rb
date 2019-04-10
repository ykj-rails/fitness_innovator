require 'rails_helper'
describe Content do
  describe '#create' do

    it "before_body_weightとafter_body_weightとperiodがあれば登録できる" do
      content = build(:content)
      expect(content).to be_valid
    end

    # it "textが空だと登録できない" do
    #   comment = build(:comment, text: "")
    #   comment.valid?
    #   expect(comment.errors[:text]).to include("を入力してください。")
    # end

  end
end
