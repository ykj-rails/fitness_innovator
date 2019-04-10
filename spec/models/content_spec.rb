require 'rails_helper'
describe Content do
  describe '#create' do

    it "before_body_weightとafter_body_weightとperiodがあれば登録できる" do
      content = build(:content)
      expect(content).to be_valid
    end

    it "before_body_weightが空だと登録できない" do
      content = build(:content, before_body_weight: "")
      content.valid?
      expect(content.errors[:before_body_weight]).to include("を入力してください。")
    end

    it "after_body_weightが空だと登録できない" do
      content = build(:content, after_body_weight: "")
      content.valid?
      expect(content.errors[:after_body_weight]).to include("を入力してください。")
    end

    it "periodが空だと登録できない" do
      content = build(:content, period: "")
      content.valid?
      expect(content.errors[:period]).to include("を入力してください。")
    end

  end
end
