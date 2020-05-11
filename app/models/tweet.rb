class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to_active_hash :category
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :image, presence: true
  validates :category_id, presence: true

  validates :title, presence: true ,length: {minimum: 15}
  validates :image, presence: true

  def self.search(search)
    return Tweet.all unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end
end
