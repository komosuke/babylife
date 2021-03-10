require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context 'ツイートが投稿できる場合' do
      it '全ての項目が存在すれば投稿できること' do
        expect(@tweet).to be_valid
      end
    end
    context 'ツイートが投稿できない場合' do
      it 'imageが空では投稿できないこと' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Imageを入力してください")
      end
      it 'titleが空では投稿できないこと' do
        @tweet.title = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Titleを入力してください")
      end
      it 'contentが空では投稿できないこと' do
        @tweet.content = ""
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Contentを入力してください")
      end
      it 'genreが空では投稿できないこと' do
      end
      it 'userが紐づいていないと投稿できないこと' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end

