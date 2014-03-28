require 'helper'

describe Tones do

  it 'should respond to new' do
    Tones::Detector.must_respond_to :new
  end

  #it 'should respond to scan' do
  #  setup_subject "clean_sin/150.wav"
  #  @subject.must_respond_to :next_window
  #end




  def setup_subject file
    path = Dir.pwd + Dir.pwd + "spec/sample/" + file
    source = Tones::FileSource.new path
    @subject = Tones::Detector.new source
  end


end
