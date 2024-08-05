class CreateOrderParties < ActiveRecord::Migration
  def change
    create_table :order_parties do |t|
      t.references :order, index: true, foreign_key: true
      t.string :name
      t.string :designation
      t.string :organization

      t.timestamps null: false
    end
  end
end
