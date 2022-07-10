require 'rails_helper'

RSpec.describe Goal, type: :model do
  it "目標が空欄なら無効な状態であること" do
    goal = Goal.new(text: nil)
    goal.valid?

    expect(goal.errors[:text]).to include("を入力してください")
  end
end
