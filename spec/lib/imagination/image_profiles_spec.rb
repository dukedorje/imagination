require 'spec_helper'
require 'imagination'
require 'mini_magick'
require 'byebug'

TEST_FILE = '1f004.png' # 64x64 PNG

class Image
  include Imagination::ImageProfiles

  def file_path(profile_name, options={})
    base_path = profile_name ? TEST_PUBLIC_DIR : TEST_FILE_PATH
    filename = profile_name ? "#{TEST_FILE}-#{profile_name}" : TEST_FILE
    File.join(base_path, filename)
  end

  def magick_image(profile_name=nil, options={})
    MiniMagick::Image.open(file_path(profile_name, options))
  end

  def save_profile(transformed_magick_image, profile, options)
    transformed_magick_image.write(file_path(profile, options))
  end
end

describe Imagination::ImageProfiles do
  before do
    setup_test_public_dir

    Image.profile(:test_profile) do |img, options|
      img.resize '50%'
    end

    @image = Image.new
  end
  after do
    empty_test_public_dir
  end

  context "#profile" do
    it "adds an entry to the profiles class variable" do
      Image.profile(:test_profile2) { } # empty block
      expect( Image.profiles.keys ).to include(:test_profile2)
    end
  end

  context "#generate_profile" do
    it "transforms an image according to a profile" do
      @image.generate_profile( :test_profile )

      img = @image.magick_image(:test_profile) # get the image, measure its size.
      expect( img.width ).to eq(32) # half of 64
    end

    it "caches the resized image file" do
      expect( File.file?(@image.file_path(:test_profile)) ).to eq(false)
      @image.generate_profile( :test_profile )
      expect( File.file?(@image.file_path(:test_profile)) ).to eq(true)
    end
  end

  context "defined method" do
    it "works" do
      expect( File.file?(@image.file_path(:test_profile)) ).to eq(false)
      @image.test_profile
      expect( File.file?(@image.file_path(:test_profile)) ).to eq(true)
    end
  end

end
