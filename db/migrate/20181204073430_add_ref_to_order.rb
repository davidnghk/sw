class AddRefToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :user_ref_no, :integer
  end
end
