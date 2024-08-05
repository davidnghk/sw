class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :issue, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :district, index: true, foreign_key: true
      t.datetime :booking_datetime
      t.string   :location
      t.string   :user_ref
      t.text     :notes
      t.datetime :filing_datetime
      t.integer  :status

      t.timestamps null: false
    end
  end
end
