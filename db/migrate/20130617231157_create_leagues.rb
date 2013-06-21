class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.text :description
      t.boolean :active
      t.references :game

      t.timestamps
    end
    add_index :leagues, :game_id
  end
end
