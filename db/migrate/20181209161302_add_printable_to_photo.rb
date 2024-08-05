class AddPrintableToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :is_printable, :boolean, default: true
  end
end
