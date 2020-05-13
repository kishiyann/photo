class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to_active_hash :category
  mount_uploader :image, ImageUploader, dependent: :destroy

  validates :title, presence: true
  validates :image, presence: true
  validates :category_id, presence: true

  def self.search(search)
    return Tweet.all unless search
    Tweet.where('title LIKE(?)', "%#{search}%")
  end
end
