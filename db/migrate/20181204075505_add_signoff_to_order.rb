class AddSignoffToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :staff_signoff_datetime, :datetime
    add_column :orders, :customer_signoff_datetime, :datetime
  end
end
