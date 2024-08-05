class AddCategoryToDefect < ActiveRecord::Migration
  def change
    add_column :defects, :category, :string
  end
end
