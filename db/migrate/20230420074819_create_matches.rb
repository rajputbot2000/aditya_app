class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.string :title
      t.string :short_title
      t.integer :views
      t.boolean :is_live
      t.string :status
      t.string :front_team
      t.string :opp_team
    end
  end
end
