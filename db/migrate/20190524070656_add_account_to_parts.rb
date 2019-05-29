class AddAccountToParts < ActiveRecord::Migration[5.2]
  def change
    add_reference :parts, :account
  end
end
