class Account < ApplicationRecord
  has_many :phone_numbers
  has_secure_password :auth_id, validations: false
end
