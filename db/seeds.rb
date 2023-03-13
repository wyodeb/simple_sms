

require 'CSV'

CSV.read(Rails.root.join('lib', 'seeds', 'accounts.csv'), headers: true, col_sep: ',').each do |row|
 Account.create(row.to_hash)
end

CSV.read(Rails.root.join('lib', 'seeds', 'phones.csv'), headers: true, col_sep: ',').each do |row|
  PhoneNumber.create(row.to_hash)
end

puts "There are now #{Account.count} rows in the accounts table table"
puts "There are now #{PhoneNumber.count} rows in the phone numbers table"