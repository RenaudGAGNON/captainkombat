class Character < ApplicationRecord

  validates_presence_of :name, :health, :hit

  private

  def hit_equilibre
    Character.min(:hit)
  end
end
