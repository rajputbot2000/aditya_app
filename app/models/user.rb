class User < ApplicationRecord
    has_many :appopens, dependent: :destroy
    has_one :account, dependent: :destroy
    has_one :user_profile, dependent: :destroy
end
