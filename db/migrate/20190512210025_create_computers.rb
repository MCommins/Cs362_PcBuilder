class CreateComputers < ActiveRecord::Migration[5.2]
  def change
    create_table :computers do |t|
      t.string :name
      t.string :owner
      t.string :parts

      t.timestamps
    end
  end
end
