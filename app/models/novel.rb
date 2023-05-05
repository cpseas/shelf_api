class Novel < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :themes

  validates :title, presence: true, length: {minimum: 2, maximum: 50}
  validates :synopsis, presence: true, length: {minimum: 21, maximum: 999}
  validates :user_id, presence: true
  validates :status, presence: true
  validates :published_date, presence: true

  scope :published_in_year, ->(year) { where(published_date: Date.new(year).all_year) }
end
