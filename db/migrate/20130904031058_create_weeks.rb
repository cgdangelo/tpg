class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.string :name
      t.references :season

      t.timestamps
    end
    add_index :weeks, :season_id
  end
end
