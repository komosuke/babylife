require 'rails_helper'

RSpec.describe Memory, type: :model do
  before do
    @memory = FactoryBot.build(:memory)
  end

  describe '記念日の保存' do
    context '記念日が保存できるとき' do
      it '全ての項目があれば保存できること' do
        expect(@memory).to be_valid
      end
      it 'contentがなくても保存できること' do
        @memory.content = ''
        expect(@memory).to be_valid
      end
    end
    context '記念日が保存できないとき' do
      it 'titleが空では保存できないこと' do
        @memory.title = ''
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Titleを入力してください")
      end
      it 'memory_dateが空では保存できないこと' do
        @memory.memory_date = ''
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Memory dateを入力してください")
      end
      it 'userが紐づいていないと投稿できないこと' do
        @memory.user = nil
        @memory.valid?
        expect(@memory.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
