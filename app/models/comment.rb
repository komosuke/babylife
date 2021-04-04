class Comment < ApplicationRecord
  belongs_to :tweet, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :text, presence: true
end
