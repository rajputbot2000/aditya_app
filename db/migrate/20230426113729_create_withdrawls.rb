class CreateWithdrawls < ActiveRecord::Migration[7.0]
  def change
    create_table :withdrawls do |t|
      t.integer :coins
      t.string :transaction_id
      t.integer :amount
      t.integer :reward_id

      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
