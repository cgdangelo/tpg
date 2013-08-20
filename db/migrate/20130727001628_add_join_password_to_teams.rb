class AddJoinPasswordToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :join_password, :string
  end
end
