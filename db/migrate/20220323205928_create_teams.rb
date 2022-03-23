class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :rank
      t.boolean :won_championship
      t.timestamps
    end
  end
end
