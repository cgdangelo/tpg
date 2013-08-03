class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :user
      t.references :team

      t.timestamps
    end
    add_index :players, :user_id
    add_index :players, :team_id
  end
end
