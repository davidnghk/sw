class AddLatitudeToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :latitude, :float
    add_column :photos, :longitude, :float
    add_column :photos, :altitude, :float
  end
end
