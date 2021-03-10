class Tweet < ApplicationRecord

  enum genre:{
    month_1:  1,
    month_2:  2,
    month_3:  3,
    month_6:  4,
    month_8:  5,
    month_10: 6,
    year_1:   7,
    year_1_5: 8,
    year_2:   9,
    year_3:   10,
    year_4:   11,
    year_5:   12,
    year_6:   13,
    year_7:   14,
    overyear: 15 
  }

  belongs_to :user
  has_one_attached :image
  has_many :comments

  with_options presence: true do
    validates :image
    validates :title
    validates :content
    validates :genre
  end
  
end
