class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :order, index: true, foreign_key: true
      t.references :defect, index: true, foreign_key: true
      t.string :location
      t.string :followup
      t.date :due_date
      t.string :responsible_person
      t.date :completion_date
      t.string :remarks

      t.timestamps null: false
    end
  end
end
