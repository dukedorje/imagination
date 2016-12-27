# require "imagination/engine"
require "imagination/configuration"

module Imagination
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end
end

require "imagination/image_profiles"
require "imagination/image_file_manager"
require "imagination/image_exception"
