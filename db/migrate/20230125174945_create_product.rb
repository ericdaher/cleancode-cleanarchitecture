class CreateProduct < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.text :description
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
