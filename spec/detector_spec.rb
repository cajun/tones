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


  tones = [150,500,275,440]
  tones.each do |tone|

    it "next pitch should be #{tone}" do
      subject = build_subject "clean_sin/#{tone}.wav"
      assert_in_delta tone, subject.next_pitch, 0.05
    end

    it "next pitch should be #{tone} with noice" do
      subject = build_subject "noice_sin/#{tone}.wav"
      assert_in_delta tone, subject.next_pitch, 0.7
    end

  end


  def build_subject file
    path = "#{Dir.pwd}/spec/sample/#{file}"
    source = Tones::FileSource.new path
    Tones::Detector.new source
  end


end
