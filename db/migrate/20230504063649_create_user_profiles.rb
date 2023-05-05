class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.string :full_name
      t.string :email
      t.string :mobile_number
      t.string :gender
      t.string :location
      t.string :occupation
      t.string :birth_date
      t.string :profile_pic
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
