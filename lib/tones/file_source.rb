require 'wavefile'

module Tones


  Window = Struct.new("Window", :sample, :rate)





  class FileSource

    WINDOW_SIZE = 4096

    def initialize path
      @data = []
      WaveFile::Reader.new(path).each_buffer(WINDOW_SIZE) do |buffer|
        @rate = buffer.sample_rate
        @data << buffer.samples
      end
    end


    def next_window
      Window.new(@data.shift, @rate)
    end


    def self.sample_sin_150
      path = Dir.pwd + "/spec/sample/clean_sin/150.wav"
      Tones::FileSource.new path
    end

    def self.sample_sin_500
      path = Dir.pwd + "/spec/sample/clean_sin/500.wav"
      Tones::FileSource.new path
    end


  end

end
