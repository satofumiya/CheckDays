class Task < ApplicationRecord
  belongs_to :subgoal
  validates :title, presence: true

end
