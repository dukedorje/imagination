class Imagination::Configuration
  attr_accessor :upload_path_prefix, :upload_dir, :cache_dir, :adapter

  def initialize
    self.upload_dir = 'images'
    self.cache_dir = 'images-cache'
    # Note: An adapter must be specified
  end
end
