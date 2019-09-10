class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :health, default: 0
      t.integer :hit, default: 0
      t.integer :experience, default: 0

      t.timestamps
    end
  end
end
