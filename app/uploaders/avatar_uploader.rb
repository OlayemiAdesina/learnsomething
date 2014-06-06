# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base  
  #def filename
  #  "avatar.png"
  #end

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
   

  # Choose what kind of storage to use for this uploader:
    storage :file
   # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
   # "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    'public/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}'
    #'app/assets/images'
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
   def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
      ActionController::Base.helpers.asset_path([version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # 'default_avatar.png' #rails will look at 'app/assets/images/default_avatar.png'
  # 'smiling-man.png'
   end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  include CarrierWave::MiniMagick
  process :resize_to_fit => [800, 800]    
    version :large do
    # returns a 300x300 image
    process :resize_to_fit => [300, 300]
   end
   
    version :medium do
      # returns a 35x35 image
      process :resize_to_fill => [150,150]
    end
    
   version :small do
    # returns a 50x50 image
    process :resize_to_fill=> [50, 50]
   end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_white_list
     %w(jpg jpeg gif png)
   end
   

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end