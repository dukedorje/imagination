require 'spec_helper'
require 'byebug'
require 'imagination'

describe Imagination::Configuration do
  it 'has a default value' do
    expect(Imagination.configuration.cache_dir).to eq 'images-cache'
  end

  it 'is configurable' do
    Imagination.configure do |config|
      config.cache_dir = 'icache'
    end
    expect(Imagination.configuration.cache_dir).to eq 'icache'
  end
end
