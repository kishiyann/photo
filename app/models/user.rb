# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :nickname,           presence: true
  validates :email,              presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,           presence: true, length: { minimum: 7 }
  validates :encrypted_password, presence: true, length: { minimum: 7 }

  def self.guest
    find_or_create_by!(nickname: 'ゲストさん', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
