class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.text :news
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
