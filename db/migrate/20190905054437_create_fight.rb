class CreateFight < ActiveRecord::Migration[6.0]
  def change
    create_table :fights do |t|
      t.references :player_one, foreign_key: {to_table: :characters}
      t.references :player_two, foreign_key: {to_table: :characters}
      t.references :winner, foreign_key: {to_table: :characters}

      t.timestamps
    end
  end
end
