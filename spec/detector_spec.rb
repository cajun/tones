require 'helper'
require 'pry'

describe Tones do

  it 'should respond to new' do
    Tones::Detector.must_respond_to :new
  end

  it 'should respond to next_pitch' do
    source = Tones::FileSource.sample_sin_150
    subject = Tones::Detector.new source
    subject.must_respond_to :next_pitch
  end


  it 'next pitch should be 150' do
    source = Tones::FileSource.sample_sin_150
    subject = Tones::Detector.new source
    subject.next_pitch.must_equal 150.0
  end

  it 'next pitch should be 500' do
    source = Tones::FileSource.sample_sin_500
    subject = Tones::Detector.new source
    assert_in_delta 500, subject.next_pitch, 0.03
  end

  def should_be_close a,b
    Math.abs( a - b ).must_
  end


end
