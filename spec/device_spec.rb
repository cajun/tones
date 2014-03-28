require 'helper'

describe Powermate do

  it 'should respond to scan' do
    Powermate::Device.must_respond_to :scan
  end

  it 'should find a powermate device' do
    pmates = Powermate::Device.scan
    pmates.first.must_be_instance_of Powermate::Device
  end

  it 'should open' do
    pmates = Powermate::Device.scan
    pmates.first.must_respond_to :open
  end

  it 'should close' do
    pmates = Powermate::Device.scan
    pmates.first.must_respond_to :close
  end


end
