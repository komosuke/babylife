require 'rails_helper'

RSpec.describe Comment, type: :model do

  before do
    @comment = FactoryBot.create(:comment)
    sleep 0.1
  end

  describe 'コメント投稿' do
    context 'コメント投稿できる場合' do
      it 'コメント入力済みであれば投稿できること' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿出来ない場合' do
      it 'textが空では投稿できないこと' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Textを入力してください")
      end
      it 'userが紐づいていないと投稿できないこと' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Userを入力してください")
      end
      it 'tweetが紐づいていないと投稿できないこと' do
        @comment.tweet = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Tweetを入力してください")
      end
    end
  end
end
