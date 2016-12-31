require 'mini_magick'

class Imagination::Adapters::MiniMagickAdapter
  def open_magick_image(file_path)
    MiniMagick::Image.open(file_path)
  end
end
