class CreateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards do |t|
      t.string :payout_name
      t.string :payout_logo
      t.string :payout_type
      t.string :payout_amount
      t.string :coin_value

      t.timestamps
    end
  end
end
