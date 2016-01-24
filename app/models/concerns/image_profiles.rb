
module ImageProfiles
  extend ActiveSupport::Concern

  included do
    cattr_accessor :profiles

    def self.profile(profile_name, &block)
      self.profiles ||= {}
      self.profiles[profile_name.to_sym] = block
      define_method(profile_name) do |options={}|
        generate_profile(profile_name, options) unless profile_generated?(profile_name, options)
      end
    end
  end

  def exec_profile(img, profile, options={})
    proc = self.profiles[profile.to_sym]
    self.instance_exec(img, options, &proc)
  end

  def generate_profile(profile, options={})
    raise "Profile #{profile} does not exist." unless self.profiles.keys.include?(profile.to_sym) # && self.respond_to?(profile.to_sym)
    unless self.respond_to? :magick_image
      raise "Model must have a 'magick_image' method which returns the image wrapped in the ImageMagick wrapper of your choice"
    end
    Rails.logger.info("Generating Profile: #{profile} #{options.inspect}")

    transformed_magick_image = exec_profile(self.magick_image, profile, options)

    save_profile(transformed_magick_image, profile, options)
  end

  # Generates the crops and resizes necessary for the requested profile.
  def generate(descriptor, options={})
    if /\d+x\d+/.match(descriptor)
      resize(descriptor)
    else
      generate_profile(descriptor, options)
    end
  end

  # Invoked if passed a single descriptor consisting of the dimensions, eg: 64x64
  def resize(dimensions)
    return if File.exists? file_path(dimensions)
    # img = magick_image
    # img.resize dimensions
    # img.write path(dimensions) # dimensions is the descriptor.
  end

  def pre_generate(profile, options={})
    # options[:format] = "jpg" unless Mime::Type.lookup_by_extension(options[:format] || self.format)
    generate_profile(profile, options) unless profile_generated?(profile, options)
  end

  def profile_generated?(profile, options={})
    raise "Profile #{profile} does not exist." unless profiles.include?(profile)

    File.exists?(file_path(profile, options))
  end

  def magick_image(profile_name=nil, options={})
    # Magick::ImageList.new(self.file_path(profile_name, options))
    # MicroMagick::Image.new(self.file_path(profile_name, options))
    MiniMagick::Image.open(self.file_path(profile_name, options))
  end

  def file_path(descriptor=nil, options={})
    if descriptor.nil?
      byebug
      # image_file.get
    end
  end

end
