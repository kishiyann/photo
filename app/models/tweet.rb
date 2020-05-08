class Tweet < ApplicationRecord
  validates :image, presence: true
  belongs_to :user
  has_many :comments 
end
