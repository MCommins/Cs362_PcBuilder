class AddPartsToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :accounts, :parts, foreign_key: true
  end
end
