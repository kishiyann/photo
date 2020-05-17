# frozen_string_literal: true

require 'rails_helper'
describe Tweet do
  describe '#create' do
    it '全てが存在すれば登録できること' do
      tweet = build(:tweet)
      expect(tweet).to be_valid
    end

    it 'titleがない場合は登録できないこと' do
      tweet = build(:tweet, title: '')
      tweet.valid?
      expect(tweet.errors[:title]).to include('を入力してください')
    end

    it 'imageがない場合は登録できないこと' do
      tweet = build(:tweet, image: '')
      tweet.valid?
      expect(tweet.errors[:image]).to include('を入力してください')
    end

    it 'category_idがない場合は登録できないこと' do
      tweet = build(:tweet, category_id: '')
      tweet.valid?
      expect(tweet.errors[:category_id]).to include('を入力してください')
    end
  end
end

RSpec.describe Tweet, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
