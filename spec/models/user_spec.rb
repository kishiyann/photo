# frozen_string_literal: true

require 'rails_helper'
describe User do
  describe '#create' do
    it '全てが存在すれば登録できること' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'nicknameがない場合は登録できないこと' do
      user = build(:user, nickname: '')
      user.valid?
      expect(user.errors[:nickname]).to include('を入力してください')
    end

    it 'emailがない場合は登録できないこと' do
      user = build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    it 'emailの入力が不十分の場合は登録できないこと' do
      user = build(:user, email: 'test@test')
      user.valid?
      expect(user.errors[:email]).to include('は不正な値です')
    end

    it 'passwordがない場合は登録できないこと' do
      user = build(:user, password: '')
      user.valid?
      expect(user.errors[:password]).to include('を入力してください')
    end

    it 'passwordが存在してもpassword_confirmationがない場合は登録できないこと' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include('とPasswordの入力が一致しません')
    end

    it ' 重複したemailが存在する場合は登録できないこと ' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('はすでに存在します')
    end

    it ' passwordが7文字以上であれば登録できること ' do
      user = build(:user, password: '0000000', password_confirmation: '0000000')
      user.valid?
      expect(user).to be_valid
    end

    it ' passwordが6文字以下であれば登録できないこと ' do
      user = build(:user, password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors[:password]).to include('は7文字以上で入力してください')
    end
  end
end

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
