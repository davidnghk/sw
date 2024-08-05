class AddPhotoDatetimeToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :photo_datetime, :datetime
  end
end
