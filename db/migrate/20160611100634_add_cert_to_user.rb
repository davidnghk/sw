class AddCertToUser < ActiveRecord::Migration
  def up
    add_column :users, :qualification, :integer
    add_column :users, :registration_no, :string
    add_column :users, :registration_chinese_name, :string
    add_column :users, :registration_english_name, :string    
    add_column :users, :registration_expiry_date, :date
    add_column :users, :aasm_state, :string
  end

  def down  
    remove_column :users, :qualification
    remove_column :users, :registration_no
    remove_column :users, :registration_chinese_name
    remove_column :users, :registration_english_name    
    remove_column :users, :registration_expiry_date
    remove_column :users, :aasm_state, :string
  end
end
