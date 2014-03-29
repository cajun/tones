module Tones

  class Detector

    def initialize source
      @source = source
    end

    def next_pitch
      window = @source.next_window

      current_max = 0
      results =[]
      window.sample.each_with_index do |s,index|
        if s < 0
          results << { index: index, value: current_max } if current_max > 0
          current_max = 0
        end
        current_max = [s,current_max].max
      end

      #remove noice
      limit = results.map{|x| x[:value]}.max * 0.5
      results = results.select{|x| x[:value] > limit}

      shifts = results.map{|x| x[:index]}
      return nil if shifts.size < 2

      window.sample.pop( window.sample.size - shifts.last  )
      window.sample.shift( shifts.first )
      shifts.pop

      f = shifts.size.to_f / window.sample.size.to_f
      f * (window.rate )

    end




  end

end
