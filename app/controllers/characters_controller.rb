class CharactersController < ApplicationController
  before_action :set_all_characters
  before_action :set_character, only: %w( edit update destroy )
  
  def index
  end

  def new
    @character = Character.new
  end

  def create
    if Character.create(character_params)
      render :index
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @character.update(character_params)
      render :index
    else
      render :edit
    end
  end

  def destroy
    @character.destroy
  end

private

  def set_all_characters
    @all_characters = Character.all
  end

  def set_character
    @character = @all_characters.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :health, :hit)
  end
end
