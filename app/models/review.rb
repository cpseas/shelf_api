class Review < ApplicationRecord
  belongs_to :user
  belongs_to :novel

  enum: rated {recommended: 0, not_recommended: 1, mixed: 2}

  validates :content, presence: true, length: {minimum: 1 , maximum: 999}
  validates :rated, presence: true
  validates :reviewed_date, presence: true
  validates :user_id, presence: true
  validates :novel_id, presence: true

  scope :rated_order, -> { order(rated: :asc)}
  # scope :reviewed_date // maybe
end
