require 'helper'

describe Tones do

  it 'should respond to new' do
    Tones::FileSource.must_respond_to :new
  end

  it 'should respond to next_window' do
    setup_subject "clean_sin/150.wav"
    @subject.must_respond_to :next_window
  end

  it 'should return a chunk of sound to analize' do
    setup_subject "clean_sin/150.wav"
    chunk = @subject.next_window
    chunk.class.must_equal Array
  end



  def setup_subject file
    path = Dir.pwd + Dir.pwd + "spec/sample/" + file
    @subject = Tones::FileSource.new path
  end


end
