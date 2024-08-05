class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :code
      t.string :name
      t.string :chi_name
      t.string :email_address

      t.timestamps null: false
    end
  end
end
