class CreateDefects < ActiveRecord::Migration
  def change
    create_table :defects do |t|
      t.string :code
      t.string :name
      t.string :chi_name

      t.timestamps null: false
    end
  end
end
