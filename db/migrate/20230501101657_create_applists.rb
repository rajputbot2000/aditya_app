class CreateApplists < ActiveRecord::Migration[7.0]
  def change
    create_table :applists do |t|
      t.string :title
      t.string :logo
      t.string :app_link
      t.string :redeem_type
      t.string :bonus
      t.string :minimum_withdrawl
      t.string :referral_code

      t.timestamps
    end
  end
end
