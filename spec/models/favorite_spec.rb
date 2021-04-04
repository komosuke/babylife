require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @favorite = FactoryBot.build(:favorite)
  end

  describe 'いいねの保存' do
    context 'いいねができるとき' do
      it 'userとtweetが紐づいていれば保存できる' do
        expect(@favorite).to be_valid
      end
    end
    context 'いいねができないとき' do
      it 'userが紐づいていないと投稿できないこと' do
        @favorite.user = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include("Userを入力してください")
      end
      it 'tweetが紐づいていないと投稿できないこと' do
        @favorite.tweet = nil
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include("Tweetを入力してください")
      end
    end
  end
end
