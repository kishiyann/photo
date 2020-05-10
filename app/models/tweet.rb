class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments 

  validates :title, presence: true ,length: {minimum: 15}
  validates :image, presence: true

  def self.search(search)
    return Tweet.all unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end
end
