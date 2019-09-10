class Fight < ApplicationRecord

  belongs_to :player_one, class_name: "Character"
  belongs_to :player_two, class_name: "Character"
  belongs_to :winner, class_name: "Character"

  before_validation :fight

  before_commit :update_players_experience

  private

  def fight
    self.winner = [player_one, player_two].sample
  end

  def looser
    # player_one == winner ? player_two : player_one
    [player_one, player_two].detect { |player| !player.eql? winner }
  end

  def update_players_experience
    # Winner 10pts +/- 20% of level difference
    winner_gain = [ 0, 16 - ((winner.experience - looser.experience)*0.1) ].max.to_i
    # Looser 4pts +- 20% of level difference
    looser_gain = [ 0, 4 - ((looser.experience - winner.experience)*0.1) ].max.to_i
    
    winner.update(experience: winner.experience + winner_gain)
    looser.update(experience: looser.experience + looser_gain)
  end

end