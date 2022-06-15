class User < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :tweets, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = 'guest'
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
