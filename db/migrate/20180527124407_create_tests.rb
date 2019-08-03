class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.integer :a
      t.integer :b
      t.integer :result
      t.string :sign
      t.boolean :right

      t.timestamps
    end
  end
end
