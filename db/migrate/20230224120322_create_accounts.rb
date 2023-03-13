class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string "username"
      t.string 'auth_id_digest'

      t.timestamps
    end
  end
end
