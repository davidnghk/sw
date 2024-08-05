class AddEmailToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :email_to, :string
    add_column :issues, :email_cc, :string
  end
end
