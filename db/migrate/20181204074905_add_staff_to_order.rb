class AddStaffToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :staff_name, :string
    add_column :orders, :staff_signoff_date, :date
    add_column :orders, :customer_name, :string
    add_column :orders, :customer_signoff_date, :date
  end
end
