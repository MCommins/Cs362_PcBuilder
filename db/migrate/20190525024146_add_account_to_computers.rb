class AddAccountToComputers < ActiveRecord::Migration[5.2]
  def change
    add_reference :computers, :account
  end
end
