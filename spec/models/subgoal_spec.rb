require 'rails_helper'

RSpec.describe Subgoal, type: :model do
  it "サブゴールが空欄なら無効な状態であること" do
    subgoal = Subgoal.new(title: nil)
    subgoal.valid?

    expect(subgoal.errors[:title]).to include("を入力してください")
  end
end
