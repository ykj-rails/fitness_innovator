require 'rails_helper'
describe Workout do
  describe '#create' do

    it "titleとmenu、week_idがあれば登録できる" do
      workout = build(:workout)
      expect(workout).to be_valid
    end

    it "titleが空だと登録できない" do
      workout = build(:workout, title: "")
      workout.valid?
      expect(workout.errors[:title]).to include("を入力してください。")
    end

    it "menuが空だと登録できない" do
      workout = build(:workout, menu: "")
      workout.valid?
      expect(workout.errors[:menu]).to include("を入力してください。")
    end

    it "week_idが空だと登録できない" do
      workout = build(:workout, week_id: "")
      workout.valid?
      expect(workout.errors[:week_id]).to include("を入力してください。")
    end

  end
end
