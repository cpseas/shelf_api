class Genre < ApplicationRecord
    has_and_belongs_to_many :novels

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :description, presence: true
    validates :active, presence: true

    scope :alphabetical_order, -> {order(name: :asc)}
end
