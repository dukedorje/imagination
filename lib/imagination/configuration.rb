class Imagination::Configuration
  attr_accessor :upload_path_prefix, :upload_dir, :cache_dir

  def initialize
    self.upload_dir = 'images'
    self.cache_dir = 'images-cache'
  end
end
