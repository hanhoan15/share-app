class Article < ApplicationRecord
  acts_as_votable
  belongs_to :user
  validates :user_id, presence: true
  validates :url, presence: true
end
