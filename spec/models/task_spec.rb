require 'rails_helper'

RSpec.describe Task, type: :model do
  it "タスクが空欄なら無効な状態であること" do
    task = Task.new(title: nil)
    task.valid?

    expect(task.errors[:title]).to include("を入力してください")
  end
end
