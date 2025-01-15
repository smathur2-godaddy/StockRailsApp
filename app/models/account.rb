class Account < ApplicationRecord
  belongs_to :user
  has_many :coins, dependent: destroy

  validates :currency, presence: true
end



