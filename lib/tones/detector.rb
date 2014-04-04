module Tones
  # Detector will look through a given wave file and parse out the pitches.
  # Right now the algorithm being used is a simple single pitch algorithm.
  #
  # Example Usage
  #
  #  path = "path/to/wave/file"
  #  source = Tones::FileSource.new path
  #  detector = Tones::Detector.new source
  #  detector.next_pitch # => returns pitch value
  #
  # Author: Lex Childs
  class Detector
    NoSampleException = Class.new Exception
    LIMIT = 0.5

    # New Tones::FileSource file to be passed in
    def initialize source
      @source = source
    end

    # Pull the next available pitch from the source
    #
    # returns [Fixnum,nil] Pitch value
    def next_pitch
      @window = @source.next_window
      @sample = @window.sample

      shifts = limited_samples.map{|x| x[:index]}
      return nil if shifts.size < 2

      # What is this doing?
      @sample.pop( @sample.size - shifts.last  )
      @sample.shift( shifts.first )
      shifts.pop

      (shifts.size.to_f / @sample.size.to_f) * @window.rate
    end


    private

    # From the current sample pull out all of the positive values from that
    # sample
    #
    # returns [Array<int>] list of all positive values in sample
    def positive_samples
      raise NoSampleException.new('No Sample') if @sample.nil?
      current_max = 0
      positive    = []
      @sample.each_with_index do |s,index|
        if s < 0
          positive << { index: index, value: current_max } if current_max > 0
          current_max = 0
        end
        current_max = [s,current_max].max
      end

      positive
    end


    # Select only the positive values that are above the limit
    #
    # returns [Array<int>] limited values
    def limited_samples
      results = positive_samples
      limit   = results.map{|x| x[:value]}.max * LIMIT
      results.select{|x| x[:value] > limit}
    end

  end

end
