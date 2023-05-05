class Account < ApplicationRecord
  belongs_to :user
  has_many :withdrawls, dependent: :destroy
  has_many :points, dependent: :destroy
end
