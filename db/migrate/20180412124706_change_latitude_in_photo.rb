class ChangeLatitudeInPhoto < ActiveRecord::Migration
  def change
  	change_column :photos, :latitude, :decimal, { precision: 15, scale: 7 }
    change_column :photos, :longitude, :decimal, { precision: 15, scale: 7 }
    change_column :photos, :altitude, :decimal, { precision: 15, scale: 7 }
  end
end
