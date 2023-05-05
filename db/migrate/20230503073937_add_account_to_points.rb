class AddAccountToPoints < ActiveRecord::Migration[7.0]
  def change
    add_reference :points, :account, foreign_key: true
  end
end
