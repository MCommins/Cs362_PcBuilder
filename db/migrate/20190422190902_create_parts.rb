class CreateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :parts do |t|
      t.string :name
      t.string :part
      t.integer :compatability

      t.timestamps
    end
  end
end
