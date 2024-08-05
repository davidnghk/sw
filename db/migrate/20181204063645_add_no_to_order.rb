class AddNoToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_no, :integer
  end
end
