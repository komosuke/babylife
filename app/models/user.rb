class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :comments, dependent: :destroy
  has_many :memories
  has_many :favorites, dependent: :destroy

  def already_favorited?(tweet)
    self.favorites.exists?(tweet_id: tweet.id)
  end

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
end
