class AddGuidToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :guid, :string
  end
end
