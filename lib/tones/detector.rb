module Tones

  class Detector

    def initialize source
      @source = source
    end

    def next_pitch
      window = @source.next_window


      shifts = []
      l = window.sample.first
      i = 0
      window.sample.each do |s|
        shifts << i if s > 0 && l <= 0
        shifts << i if s < 0 && l >= 0
        i = i + 1
        l = s
      end

      return nil if shifts.size < 2

      window.sample.pop( window.sample.size - shifts.last  )
      window.sample.shift( shifts.first )
      shifts.pop

      f = shifts.size.to_f / window.sample.size.to_f
      f * (window.rate / 2.0)

    end




  end

end
