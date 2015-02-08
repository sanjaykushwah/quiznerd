class Deck < ActiveRecord::Base
  include DeckFinder
  include Tagged

  belongs_to  :user
  has_many    :flash_cards
  has_many    :taggings, as: :taggable, dependent: :destroy
  has_many    :tags, through: :taggings

  STATUSES =  %w(Private Public)
  validates :name,                presence: true, length: { maximum: 45 }
  validates :description,         presence: true
  validates :user_id,             presence: true
  validates :flash_cards_count,   presence: true
  validates :status,              inclusion: { in: STATUSES }

  def self.with_flash_cards(id)
    Deck.includes(:flash_cards).find(id)
  end

end