class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :coin_balance
      t.string :refer_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
