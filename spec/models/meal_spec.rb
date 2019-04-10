require 'rails_helper'
describe Meal do
  describe '#create' do

    context '保存できる場合' do
      it "titleとmenuがあれば登録できる" do
        meal = build(:meal)
        expect(meal).to be_valid
      end
    end

    context '保存に失敗する場合' do
      it "titleが空だと登録できない" do
        meal = build(:meal, title: "")
        meal.valid?
        expect(meal.errors[:title]).to include("を入力してください。")
      end

      it "menuが空だと登録できない" do
        meal = build(:meal, menu: "")
        meal.valid?
        expect(meal.errors[:menu]).to include("を入力してください。")
      end
    end

  end
end
