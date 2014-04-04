require 'helper'

describe Tones do

  it 'should respond to new' do
    Tones::FileSource.must_respond_to :new
  end

  it 'should respond to next_window' do
    subject = Tones::FileSource.sample_sin_150
    subject.must_respond_to :next_window
  end

  it 'should return a chunk of sound to analize' do
    subject = Tones::FileSource.sample_sin_150
    chunk = subject.next_window
    chunk.class.must_equal Tones::Window
  end


end
