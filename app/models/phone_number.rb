class PhoneNumber < ApplicationRecord
  belongs_to :account, dependent: :destroy
end
