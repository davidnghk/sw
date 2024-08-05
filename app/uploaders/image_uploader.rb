# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  process :auto_orient # this should go before all other "process" steps
  
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick                                                  

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/sw/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  process :resize_to_limit => [1600, 1600]
  #process :efficient_conversion, :if => :pdf?
  #process :convert => 'png'

  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
     process :resize_to_limit => [1600, 1600]
     process :efficient_conversion, :if => :pdf?
     #process :paper_shape
     #process :strip
     #process :convert => 'jpg'  #<---Move it here and it works everywhere else

    def efficient_conversion
      manipulate! do |img|
        img.format("png") do |c|
          c.fuzz        "3%"
          c.trim
          c.colorspace  "sRGB"
        end
        img
      end
    end

   def full_filename (for_file = model.logo.file)
     super.chomp(File.extname(super)) + '.jpg'
   end 
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
     %w(jpg jpeg pdf)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  #def filename
  #  super.chomp(File.extname(super)) + '.png' if original_filename.present?
  #end
  # def filename
  #   "something.jpg" if original_filename
  # end
  def set_content_type(*args)
     self.file.instance_variable_set(:@content_type, "image/jpeg")
  end

  def auto_orient
    manipulate! do |image|
      image.tap(&:auto_orient)
    end
  end

  protected

    def pdf?(new_file)
      new_file.content_type.include? "/pdf"
    end

end
