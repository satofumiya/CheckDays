class Goal < ApplicationRecord
  belongs_to :user
  has_many :subgoals, dependent: :destroy

  validates :text, presence: true
end
