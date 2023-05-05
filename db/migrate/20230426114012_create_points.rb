class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.string :logo
      t.string :name
      t.integer :coins

      t.timestamps
    end
  end
end
