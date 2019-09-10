module CharacterConcern
  extend ActiveSupport::Concern

  included do
    
    def set_all_characters
      @all_characters = Character.all
    end
    
  end

end
