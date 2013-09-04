class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :name
      t.boolean :active
      t.references :league

      t.timestamps
    end
    add_index :seasons, :league_id
  end
end
