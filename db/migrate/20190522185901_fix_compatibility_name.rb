class FixCompatibilityName < ActiveRecord::Migration[5.2]
  def change
    rename_column :parts, :compatability, :compatibility
  end
end
