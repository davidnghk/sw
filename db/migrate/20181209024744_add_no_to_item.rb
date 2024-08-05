class AddNoToItem < ActiveRecord::Migration
  def change
    add_column :items, :no, :integer
  end
end
