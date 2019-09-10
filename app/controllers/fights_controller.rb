class FightsController < ApplicationController
  include CharacterConcern

  before_action :set_all_characters, only: :player_selector
  before_action :set_new_fight

  def player_selector
    @fight.assign_attributes(fight_params) if params[:fight].present?
  end
  
  def fight
    @fight.assign_attributes(fight_params)
    @fight.save
    redirect_to menu_index_path
  end

private

  def fight_params
    params.require(:fight).permit(:player_one_id, :player_two_id)
  end

  def set_new_fight
    @fight = Fight.new
  end

end
