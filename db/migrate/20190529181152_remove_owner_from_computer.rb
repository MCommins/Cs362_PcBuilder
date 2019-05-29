class RemoveOwnerFromComputer < ActiveRecord::Migration[5.2]
  def change
    remove_column :computers, :owner
  end
end
