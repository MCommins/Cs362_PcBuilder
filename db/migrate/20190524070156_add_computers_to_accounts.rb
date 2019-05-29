class AddComputersToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :accounts, :computers, foreign_key: true
  end
end
