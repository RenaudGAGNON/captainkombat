class Character < ApplicationRecord

  has_many :plays_as_one, class_name: 'Fight', foreign_key: "player_one_id"
  has_many :plays_as_two, class_name: 'Fight', foreign_key: "player_two_id"
  has_many :victories, class_name: 'Fight', foreign_key: "winner_id"

  validates_presence_of :name, :health, :hit

  # has_one_attached :avatar

  def initialize(*)
    super
    @experience = 0
  end

  private

  def hit_equilibre
    Character.min(:hit)
  end

end
