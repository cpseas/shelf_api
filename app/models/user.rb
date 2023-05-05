class User < ApplicationRecord
  has_many :novels
  has_many :reviews

  validates :user_name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 99}
  validates :bio, presence: true, length: {minimum: 21, maximum: 999}
  validates :password, presence: true, length: {minimum: 10, maximum: 255}
  validates :role, presence: true
  validates :email, presence: true, uniqueness: true, length: {minimum: 12}, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :alphabetical_order, -> { order(name: :asc)}
end
