class Subgoal < ApplicationRecord
  belongs_to :goal
  has_many :tasks
  validates :title, presence: true
end
