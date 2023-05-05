class CreateGamePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :game_points do |t|
      t.string :title
      t.string :img
      t.string :link
      t.string :game_amount

      t.timestamps
    end
  end
end
