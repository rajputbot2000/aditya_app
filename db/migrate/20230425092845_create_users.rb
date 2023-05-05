class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :deviceId
      t.string :deviceType
      t.string :deviceName
      t.string :socialType
      t.string :socialId
      t.string :socialToken
      t.string :socialEmail
      t.string :socialName
      t.string :socialImgurl
      t.string :advertisingId
      t.string :versionName
      t.string :versionCode
      t.string :utmSource
      t.string :utmMedium
      t.string :utmTerm
      t.string :utmContent
      t.string :utmCampaign
      t.string :securityToken

      t.timestamps
    end
  end
end
