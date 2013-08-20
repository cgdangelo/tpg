class AddLeagueToTeams < ActiveRecord::Migration
  def change
    change_table :teams do |t|
      t.references :league
    end
  end
end
