class Photo < ActiveRecord::Base
  #belongs_to :order
  belongs_to :photoable, polymorphic: true

  scope :General, -> { where(category: :General)}
  scope :Before, -> { where(category: :Before)}
  scope :After, -> { where(category: :After)}

  scope :Printable, -> { where(is_printable: true) }
  scope :NotPrintable, -> { where(is_printable: false) }

  enum category: [:General, :Before, :After]

  mount_uploader :image, ImageUploader 
  
  before_create do
    puts image.path
    if File.extname(image.path) != ".pdf" 
		if EXIFR::JPEG.new(image.path).exif?   
      begin             # => true
			   PhotoGeoloader.new(image.path).place_attributes self  
         imgfile = EXIFR::JPEG.new(image.path)
         self.photo_datetime = imgfile.date_time
      rescue Exception
        puts "Error in setting GPS data"
      end         
		end
	end
  end

end
