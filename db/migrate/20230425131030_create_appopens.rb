class CreateAppopens < ActiveRecord::Migration[7.0]
  def change
    create_table :appopens do |t|
      t.string :version_name
      t.string :version_code
      t.string :location
      t.string :source_ip
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
