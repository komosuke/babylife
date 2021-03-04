class AfterBirth < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '生後0ヶ月' },
    { id: 3, name: '生後1ヶ月' },
    { id: 4, name: '生後2ヶ月' },
    { id: 5, name: '生後3ヶ月' },
    { id: 6, name: '生後6ヶ月頃' },
    { id: 7, name: '生後8ヶ月頃' },
    { id: 8, name: '生後10ヶ月頃' },
    { id: 9, name: '1歳' },
    { id: 10, name: '1歳半' },
    { id: 11, name: '2歳' },
    { id: 12, name: '3歳' },
    { id: 13, name: '4歳' },
    { id: 14, name: '5歳' },
    { id: 15, name: '6歳' },
    { id: 16, name: '7歳以上' }
  ]

  include ActiveHash::Associations
  has_many :tweets
end
