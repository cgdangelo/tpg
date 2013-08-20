class RenameJoinPasswordToPasswordDigestInTeams < ActiveRecord::Migration
  def change
    rename_column :teams, :join_password, :password_digest
  end
end
