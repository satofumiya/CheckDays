FactoryBot.define do
  factory :task do
    task { "MyString" }
    done { false }
    subgoal_id { 1 }
  end
end
